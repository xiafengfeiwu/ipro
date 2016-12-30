package com.pro.servlet;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.pro.entity.DeviceConnect;
import com.pro.service.DeviceConnentService;
import com.pro.util.PublicUtil;

@Component("collectMainServlet")
public class CollectMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Autowired
	DeviceConnentService deviceConnentService;

	private final Logger logger = Logger.getLogger(CollectMainServlet.class);

	public CollectMainServlet() {
		super();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		//startService(12121);
	}

	@Override
	public void destroy() {
		super.destroy();
	}

	void startService(int port) {
		new Thread(new Runnable() {
			@SuppressWarnings("resource")
			@Override
			public void run() {
				ServerSocket serverSocket = null;
				try {
					serverSocket = new ServerSocket(port);
				} catch (IOException e1) {
					e1.printStackTrace();
				}
				logger.info("Port Listen: " + port);
				Socket socket = null;
				while (true) {
					if (serverSocket == null) {
						logger.info("Service Close");
						return;
					}
					try {
						logger.info("Wait...");
						socket = serverSocket.accept(); // 主线程获取客户端连接
						logger.info("Get Connect.");
						logger.info("Open Thread Handle");
						new Thread(new HandlerLongLink(socket)).start(); // 创建线程并启动线程
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}).start();
	}

	private String Byte2String(byte[] ba, int l) {
		String s = "";
		for (int i = 0; i < l; ++i) {
			s += String.format("%02x", ba[i]);
		}
		return s;
	}

	private String String2Byte(String str) {
		String s = "";
		for (int i = 0; i < str.length(); i++) {
			if (i % 2 == 0) {
				s += " ";
			}
			s += str.charAt(i);
		}
		return s;
	}

	class HandlerLongLink implements Runnable {
		private Socket socket;

		public HandlerLongLink(Socket socket) {
			this.socket = socket;
		}

		public void run() {
			OutputStream os = null;
			BufferedInputStream bis = null;
			try {
				logger.info("New Connect:  " + socket.getInetAddress() + ":" + socket.getPort());
				saveConnect(socket);
				byte[] readBuf = new byte[4096];
				socket.setSoTimeout(60 * 1000 * 5);
				bis = new BufferedInputStream(socket.getInputStream());
				os = socket.getOutputStream();
				PrintWriter pw = new PrintWriter(os);
				while (true) {
					int length = -1;
					DeviceConnect connect = null;
					try {
						logger.info("Wait read...");
						length = bis.read(readBuf);
						connect = deviceConnentService.findOnlineConnectByIpWithPort(socket.getInetAddress().getHostAddress(), socket.getPort());
						if (length < 0) {
							logger.info("Connect Disconnect");
							if (connect != null) {
								deviceConnentService.closeConnent(connect);
							}
							return;
						}
					} catch (SocketTimeoutException e2) {
						logger.info("Read Error; Connect Disconnect");
						return;
					}
					if (connect != null) {
						connect.setLastModifyTime(new Date());
						deviceConnentService.updateConnent(connect);
					}
					String readString = Byte2String(readBuf, length);
					// RawDataQueue entity = new RawDataQueue();
					// entity.setCreateAt(PublicUtil.now());
					// entity.setStatus("N");
					// entity.setData(readString.replaceAll(" ", ""));
					// entity.setType("NBJL");
					// rawDataQueueService.create(entity);
					// RawData rawData = new RawData();
					// rawData.setCreateAt(PublicUtil.now());
					// rawData.setData(readString.replaceAll(" ", ""));
					// rawData.setType("NBJL");
					// rawDataService.create(rawData);
					logger.info(String2Byte(readString));
					pw.write(String2Byte(readString));
					pw.flush();
					logger.info("Server Write Data");
					logger.info("Sleeping...");
					Thread.sleep(100);
					logger.info("Sleeped...");
				}
			} catch (Exception e) {
				logger.info("Connect Exception");
			}
		}
	}

	class HandlerOneLink implements Runnable {
		private Socket socket;

		public HandlerOneLink(Socket socket) {
			this.socket = socket;
		}

		public void run() {
			OutputStream os = null;
			BufferedInputStream bis = null;
			PrintWriter pw = null;
			try {
				logger.info("New Connent: " + socket.getInetAddress() + ":" + socket.getPort());
				byte[] readBuf = new byte[4096];
				socket.setSoTimeout(60 * 1000 * 5);
				bis = new BufferedInputStream(socket.getInputStream());
				os = socket.getOutputStream();
				pw = new PrintWriter(os);
				int length = -1;
				try {
					length = bis.read(readBuf);
					if (length < 0) {
						logger.info("No Data, Connent Disconnect");
						return;
					}
				} catch (SocketTimeoutException e2) {
					logger.info("Read Error; Connect Disconnect");
					return;
				}
				String readString = Byte2String(readBuf, length);
				// RawDataQueue entity = new RawDataQueue();
				// entity.setCreateAt(PublicUtil.now());
				// entity.setStatus("N");
				// entity.setData(readString.replaceAll(" ", ""));
				// entity.setType("WYTK");
				// rawDataQueueService.create(entity);
				// RawData rawData = new RawData();
				// rawData.setCreateAt(PublicUtil.now());
				// rawData.setData(readString.replaceAll(" ", ""));
				// rawData.setType("WYTK");
				// rawDataService.create(rawData);
				pw.write(String2Byte(readString));
				pw.flush();
				pw.close();
				logger.info("Server Write Data");
				logger.info("Sleeping...");
				Thread.sleep(1000);
			} catch (Exception e) {
				logger.info("Connect Exception");
			} finally {
				try {
					if (os != null)
						os.close();
					if (bis != null)
						bis.close();
					if (socket != null)
						socket.close();
				} catch (IOException e) {
					logger.info("Connect Close Exception");
				}
			}
		}
	}

	// 保存连接
	private void saveConnect(Socket socket) {
		DeviceConnect connect = new DeviceConnect();
		connect.setConnectId(PublicUtil.initId());
		connect.setConnectIp(socket.getInetAddress().getHostAddress());
		connect.setConnectPort(socket.getPort());
		connect.setDeviceSn(null);
		connect.setCreateTime(new Date());
		connect.setLastModifyTime(new Date());
		connect.setCloseTime(null);
		deviceConnentService.createConnect(connect);
	}

}

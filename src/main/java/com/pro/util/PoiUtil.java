package com.pro.util;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;

public class PoiUtil {
	@SuppressWarnings("deprecation")
	public static void downloadXlsFile(HttpServletResponse response, String title, String[] rowName, List<Object[]> dataList) throws Exception {
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("表1");
		sheet.setDefaultColumnWidth(15);
		HSSFRow row = sheet.createRow(0);
		HSSFCell cell = row.createCell(0);
		HSSFCellStyle cellStyle = PoiUtil.getColumnTopStyle(workbook);
		cell.setCellStyle(cellStyle);
		cell.setCellValue(title);
		HSSFCellStyle style = PoiUtil.getStyle(workbook);
		sheet.addMergedRegion(new CellRangeAddress(0, 1, 0, rowName.length - 1));
		int columnNum = rowName.length;
		HSSFRow hssfRow = sheet.createRow(2);
		for (int i = 0; i < columnNum; i++) {
			HSSFCell cellRowName = hssfRow.createCell(i);
			cellRowName.setCellType(CellType.STRING);
			HSSFRichTextString textString = new HSSFRichTextString(rowName[i]);
			cellRowName.setCellValue(textString);
			cellRowName.setCellStyle(cellStyle);
		}
		for (int i = 0; i < dataList.size(); i++) {
			Object[] obj = dataList.get(i);
			HSSFRow row2 = sheet.createRow(i + 3);
			for (int j = 0; j < obj.length; j++) {
				HSSFCell cell2 = null; // 设置单元格的数据类型
				if (j == 0) {
					cell2 = row2.createCell(j, CellType.NUMERIC);
					cell2.setCellValue(i + 1);
				} else {
					cell2 = row2.createCell(j, CellType.STRING);
					if (!"".equals(obj[j]) && obj[j] != null) {
						cell2.setCellValue(obj[j].toString()); // 设置单元格的值
					}
				}
				cell2.setCellStyle(style);
			}
		}

		HSSFRow footRow = sheet.createRow(dataList.size() + 2);
		HSSFCell footCell = footRow.createCell(0);
		footCell.setCellStyle(PoiUtil.getColumnFootStyle(workbook));
		footCell.setCellValue("数据来源");
		sheet.addMergedRegion(new CellRangeAddress(dataList.size() + 2, dataList.size() + 3, 0, rowName.length - 1));

		for (int colNum = 0; colNum < columnNum; colNum++) {
			int columnWidth = sheet.getColumnWidth(colNum) / 256;
			for (int rowNum = 0; rowNum < sheet.getLastRowNum(); rowNum++) {
				HSSFRow currentRow;
				// 当前行未被使用过
				if (sheet.getRow(rowNum) == null) {
					currentRow = sheet.createRow(rowNum);
				} else {
					currentRow = sheet.getRow(rowNum);
				}
				if (currentRow.getCell(colNum) != null) {
					HSSFCell currentCell = currentRow.getCell(colNum);
					if (currentCell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
						int length = currentCell.getStringCellValue().getBytes().length;
						if (columnWidth < length) {
							columnWidth = length;
						}
					}
				}
			}
			if (colNum == 0) {
				sheet.setColumnWidth(colNum, (columnWidth - 2) * 256);
			} else {
				sheet.setColumnWidth(colNum, (columnWidth + 4) * 256);
			}
		}
		if (workbook != null) {
			try {
				String fileName = "Excel-" + String.valueOf(System.currentTimeMillis()).substring(4, 13) + ".xls";
				String headStr = "attachment; filename=\"" + fileName + "\"";
				response.setContentType("application/octet-stream");
				response.setHeader("Content-Disposition", headStr);
				OutputStream out = response.getOutputStream();
				workbook.write(out);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/*
	 * 列头单元格样式
	 */
	private static HSSFCellStyle getColumnTopStyle(HSSFWorkbook workbook) {
		// 设置字体
		HSSFFont font = workbook.createFont();
		// 设置字体大小
		font.setFontHeightInPoints((short) 11);
		// 字体加粗
		font.setBold(true);
		// 设置字体名字
		font.setFontName("Courier New");
		// 设置样式;
		HSSFCellStyle style = workbook.createCellStyle();
		// 设置底边框;
		style.setBorderBottom(BorderStyle.THIN);
		// 设置底边框颜色;
		style.setBottomBorderColor(HSSFColor.BLACK.index);
		// 设置左边框;
		style.setBorderLeft(BorderStyle.THIN);
		// 设置左边框颜色;
		style.setLeftBorderColor(HSSFColor.BLACK.index);
		// 设置右边框;
		style.setBorderRight(BorderStyle.THIN);
		// 设置右边框颜色;
		style.setRightBorderColor(HSSFColor.BLACK.index);
		// 设置顶边框;
		style.setBorderTop(BorderStyle.THIN);
		// 设置顶边框颜色;
		style.setTopBorderColor(HSSFColor.BLACK.index);
		// 在样式用应用设置的字体;
		style.setFont(font);
		// 设置自动换行;
		style.setWrapText(false);
		// 设置水平对齐的样式为居中对齐;
		style.setAlignment(HorizontalAlignment.CENTER);
		// 设置垂直对齐的样式为居中对齐;
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		return style;
	}

	/*
	 * 列数据信息单元格样式
	 */
	private static HSSFCellStyle getStyle(HSSFWorkbook workbook) {
		// 设置字体
		HSSFFont font = workbook.createFont();
		// 设置字体大小
		// font.setFontHeightInPoints((short)10);
		// 字体加粗
		// font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		// 设置字体名字
		font.setFontName("Courier New");
		// 设置样式;
		HSSFCellStyle style = workbook.createCellStyle();
		// 设置底边框;
		style.setBorderBottom(BorderStyle.THIN);
		// 设置底边框颜色;
		style.setBottomBorderColor(HSSFColor.BLACK.index);
		// 设置左边框;
		style.setBorderLeft(BorderStyle.THIN);
		// 设置左边框颜色;
		style.setLeftBorderColor(HSSFColor.BLACK.index);
		// 设置右边框;
		style.setBorderRight(BorderStyle.THIN);
		// 设置右边框颜色;
		style.setRightBorderColor(HSSFColor.BLACK.index);
		// 设置顶边框;
		style.setBorderTop(BorderStyle.THIN);
		// 设置顶边框颜色;
		style.setTopBorderColor(HSSFColor.BLACK.index);
		// 在样式用应用设置的字体;
		style.setFont(font);
		// 设置自动换行;
		style.setWrapText(false);
		// 设置水平对齐的样式为居中对齐;
		style.setAlignment(HorizontalAlignment.CENTER);
		// 设置垂直对齐的样式为居中对齐;
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		return style;

	}

	/*
	 * 列头单元格样式
	 */
	private static HSSFCellStyle getColumnFootStyle(HSSFWorkbook workbook) {
		// 设置字体
		HSSFFont font = workbook.createFont();
		// 设置字体大小
		font.setFontHeightInPoints((short) 8);
		// 设置字体名字
		font.setFontName("Courier New");
		// 设置样式;
		HSSFCellStyle style = workbook.createCellStyle();
		// 设置底边框;
		style.setBorderBottom(BorderStyle.THIN);
		// 设置底边框颜色;
		style.setBottomBorderColor(HSSFColor.BLACK.index);
		// 设置左边框;
		style.setBorderLeft(BorderStyle.THIN);
		// 设置左边框颜色;
		style.setLeftBorderColor(HSSFColor.BLACK.index);
		// 设置右边框;
		style.setBorderRight(BorderStyle.THIN);
		// 设置右边框颜色;
		style.setRightBorderColor(HSSFColor.BLACK.index);
		// 设置顶边框;
		style.setBorderTop(BorderStyle.THIN);
		// 设置顶边框颜色;
		style.setTopBorderColor(HSSFColor.BLACK.index);
		// 在样式用应用设置的字体;
		style.setFont(font);
		// 设置自动换行;
		style.setWrapText(false);
		// 设置水平对齐的样式为居中对齐;
		style.setAlignment(HorizontalAlignment.RIGHT);
		// 设置垂直对齐的样式为居中对齐;
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		return style;
	}
}

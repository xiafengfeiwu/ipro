package com.pro.quartz;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.log4j.Logger;
import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.TriggerBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.stereotype.Component;

@Component("weatherQuartzServlet")
public class WeatherQuartzServlet extends HttpServlet {
	private static final Logger logger = Logger.getLogger(WeatherQuartzServlet.class);
	private static final long serialVersionUID = 1L;

	@Autowired
	private SchedulerFactoryBean schedulerFactoryBean;

	@Override
	public void init(ServletConfig config) throws ServletException {
		String name = "weatherDataName";
		String group = "weatherDataGroup";
		// 获取调度程序
		// schedulerFactoryBean 由spring创建注入
		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		JobDetail jobDetail = JobBuilder.newJob(WeatherQuartzJob.class).withIdentity(name, group).build();
		// 表达式调度构建器
		CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(config.getInitParameter("cronSchedule"));
		try {
			CronTrigger trigger = TriggerBuilder.newTrigger().withIdentity(name, group).withSchedule(scheduleBuilder).build();
			scheduler.scheduleJob(jobDetail, trigger);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
}
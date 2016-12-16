package com.pro.quartz;

import org.apache.log4j.Logger;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import com.pro.service.WebSystemService;

@DisallowConcurrentExecution
public class AnalysisQuartzJob implements Job {
	Logger logger = Logger.getLogger(AnalysisQuartzJob.class);

	@Autowired
	WebSystemService systemService;

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		logger.info(systemService.findInfo().getSystemJianPin());
		logger.info(context.getFireTime().getTime());
	}

}

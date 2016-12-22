<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<base
	href="<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath() + "/"%>" />
<link href="resources/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="resources/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="resources/css/plugins/chosen/chosen.css" rel="stylesheet">
<link href="resources/css/plugins/markdown/bootstrap-markdown.min.css" rel="stylesheet" />
<link href="resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/style.min.css?v=4.1.0" rel="stylesheet">
<style type="text/css">.md-editor>.md-header{display: none};</style>
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content  animated fadeIn">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>天气服务</h5>
						<div class="ibox-tools">
							<a class="dropdown-toggle" data-toggle="dropdown"
								href="javascript:;"> <i class="fa fa-bars"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="javascript:;"
									onclick="window.location.reload()"> <i
										class="fa fa-refresh"></i> &nbsp; 刷新页面
								</a></li>
							</ul>
						</div>
					</div>
					<div class="ibox-content">
						<div class="tabs-container">
		                    <ul class="nav nav-tabs">
		                    	<shiro:hasPermission name="ReleaseWarning">
		                       		<li class="active"><a data-toggle="tab" href="#tab-Release" aria-expanded="true"><i class="fa fa-warning"></i> 发布天气预警</a></li>
		                        </shiro:hasPermission>
		                        <li <shiro:lacksPermission name="ReleaseWarning">class="active"</shiro:lacksPermission>><a data-toggle="tab" id="initSelectHtml" href="#tab-Search" aria-expanded="false"><i class="fa fa-globe"></i> 查询城市天气</a></li>
		                    </ul>
		                    <div class="tab-content">
		                    	<shiro:hasPermission name="ReleaseWarning">
			                        <div id="tab-Release" class="tab-pane active">
			                            <div class="panel-body">
									        <form action="weather/releaseWarningAction.jspx" method="post">
				                                <div class="row">
													<div class="col-xs-12">
														<p>在系统手动发布天气预警信息（预警信息来源：①系统发布 ② 来源第三方接口），同一区域新的预警会覆盖旧的预警。</p>
						       							<div class="hr-line-dashed"></div>
						                            	<c:if test="${message!=null && !''.equals(message) }">
													    	<div id="alertMsgBox" class="alert alert-${status} alert-dismissable">
													            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
													            ${message }
													        </div>
															<script>setTimeout(function(){$("#alertMsgBox").alert('close')}, 1500)</script>
												        </c:if>
													</div>
													<div class="col-xs-4">
														<div class="form-group">
															<label class="font-noraml"><i class="fa fa-asterisk"></i> 选择城市</label>
															<div class="input-group">
																<select data-placeholder="选择一个城市..." class="chosen-select" style="width: 200px;" name="weatherCityCode">
																	<option value="">请选择一个城市</option>
																	<c:forEach items="${citys }" var="city"><option value="${city.code }"> ${city.county } , ${city.province}</option></c:forEach>
																</select>
															</div>
														</div>
													</div>
													<div class="col-xs-4">
									                    <div class="form-group">
									                       <label class="font-noraml"><i class="fa fa-asterisk"></i> 选择预警级别</label>
									                       <div class="input-group">
									                            <select data-placeholder="选择一个预警级别..." class="chosen-select" style="width: 200px;" name="earlyWarnLevel">
																	<option value="">请选择一个预警级别</option>
																	<option value="蓝色">蓝色 （一般）</option>
																	<option value="黄色">黄色 （较重）</option>
																	<option value="橙色">橙色 （严重）</option>
																	<option value="红色">红色 （ 特别严重）</option>
																</select>
									                       </div>
									                    </div>
													</div>
													<div class="col-xs-4">
									                    <div class="form-group">
									                       <label class="font-noraml"><i class="fa fa-asterisk"></i> 选择预警类型</label>
									                       <div class="input-group">
									                            <select data-placeholder="选择一个预警类型..." class="chosen-select" style="width: 200px;" name="earlyWarnType">
																	<option value="">请选择一个预警类型</option>
																	<option value="台风">台风(dafeng)</option>
																	<option value="暴雨">暴雨(baoyu)</option>
																	<option value="暴雪">暴雪(baoxue)</option>
																	<option value="寒潮">寒潮(hanchao)</option>
																	<option value="大风">大风(dafeng)</option>
																	<option value="沙尘暴">沙尘暴(shachenbao)</option>
																	<option value="高温">高温(gaowen)</option>
																	<option value="干旱">干旱(ganhan)</option>
																	<option value="雷电">雷电(leidian)</option>
																	<option value="冰雹">冰雹(bingbao)</option>
																	<option value="霜冻">霜冻(shuangdong)</option>
																	<option value="霾">霾(mai)</option>
																	<option value="道路结冰">道路结冰(daolujiebing)</option>
																	<option value="寒冷">寒冷(hanleng)</option>
																	<option value="灰霾">灰霾(huimai)</option>
																	<option value="雷电大风">雷电大风(leidiandafeng)</option>
																	<option value="森林火险">森林火险(shenlinhuoxian)</option>
																	<option value="降温">降温(jiangwen)</option>
																	<option value="道路冰雪">道路冰雪(daolubingxue)</option>
																	<option value="干热风">干热风(reganfeng)</option>
																	<option value="低温">低温(diwen)</option>
																	<option value="冰冻">冰冻(bingdong)</option>
																</select>
									                       </div>
									                    </div>
													</div>
													<div class="col-xs-5">
									                    <div class="form-group">
									                       <label class="font-noraml"><i class="fa fa-asterisk"></i> 预警标题</label>
									                       <input type="text" name="earlyWarnTitle" class="form-control" value="">
									                    </div>
													</div>
													<div class="col-xs-12">
									                    <div class="form-group">
									                      	<label class="font-noraml"><i class="fa fa-asterisk"></i> 预警描述</label>
									                      	<textarea name="earlyWarnTxt" id="weatherDetailText" data-iconlibrary="fa" rows="3"></textarea>
									                    </div>
													</div>
													<div class="col-xs-12">
									                    <div class="form-group">
									                        <div class="col-sm-12 text-center">
									                        	<button class="btn btn-primary" type="submit">发布</button>
									                        </div>
									                    </div>
													</div>
												</div>
											</form>
			                            </div>
			                        </div>
		                        </shiro:hasPermission>
		                        <div id="tab-Search" <shiro:hasPermission name="ReleaseWarning">class="tab-pane"</shiro:hasPermission><shiro:lacksPermission name="ReleaseWarning">class="tab-pane active"</shiro:lacksPermission>>
		                            <div class="panel-body">
		                               <div class="row">
											<div class="col-xs-4">
												<div class="form-group">
													<label class="font-noraml">选择一个城市</label>
													<div class="input-group">
														<select data-placeholder="选择一个城市..." class="chosen-select" style="width: 240px;" onchange="selectCityHandler(this)">
															<option value="">请选择一个城市</option>
															<c:forEach items="${citys }" var="city"><option value="${city.code }"> ${city.county } , ${city.province}</option></c:forEach>
														</select>
													</div>
												</div>
											</div>
											<div class="col-xs-4" id="weatherBaseBox"></div>
											<div class="col-xs-4" id="weatherAlarmBox"></div>
										</div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script id="weatherBaseTemp" type="text/html">
		<h5>天气基本信息</h5>
		<img class="pull-right" alt="多云" src="{{condCodeUrl}}"/>
		<p>城市编码：{{weatherCityCode}}</p>
	    <p>最新天气：{{condTxt}}</p>
	    <p>获取时间：{{collectDate |dateFormat:"yyyy-MM-dd" }}</p>
	    <p>体感温度：{{fl}} ℃</p>
	    <p>相对湿度：{{hum}} %</p>
	    <p>降水量：{{pcpn}} mm</p>
	    <p>气压：{{pres}} Pa</p>
	    <p>监测温度：{{tmp}} ℃</p>
	    <p>能见度：{{vis}} km</p>
	    <p>风向：{{windDir}}</p>
	    <p>风力：{{windSc}}</p>
	    <p>风速：{{windSpd}} km/h</p>
	</script>
	<script id="weatherAlarmTemp" type="text/html">
		<h5>天气预警信息</h5>
		<p>预警标题： {{earlyWarnTitle}}（{{earlyWarnStat}}）</p>
		<p>发布时间：{{earlyWarnTime |dateFormat:"yyyy-MM-dd" }}</p>
		<p>预警级别：{{earlyWarnLevel}}</p>
		<p>预警类型：{{earlyWarnType}}</p>
		<p>预警描述：{{earlyWarnTxt}}</p>
	</script>
	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="resources/js/plugins/chosen/chosen.jquery.js"></script>
    <script type="text/javascript" src="resources/js/plugins/markdown/markdown.js"></script>
    <script type="text/javascript" src="resources/js/plugins/markdown/to-markdown.js"></script>
    <script type="text/javascript" src="resources/js/plugins/markdown/bootstrap-markdown.js"></script>
    <script type="text/javascript" src="resources/js/plugins/markdown/bootstrap-markdown.zh.js"></script>
	<script src="resources/js/content.min.js?v=1.0.0"></script>
	<script src="resources/js/plugins/layer/layer.min.js"></script>
	<script src="resources/js/plugins/art-template/template.js"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$('.chosen-select').chosen({
				allow_single_deselect : !0
			});
			$("#initSelectHtml").on("click", function(){
				$(this).unbind("click");
				$(".chosen-container-single").attr("style", "width:240px");
			})
			$('#weatherDetailText').markdown({
				hiddenButtons:['cmdPreview', 'cmdBold', 'cmdItalic', 'cmdHeading', 'cmdImage', 'cmdUrl', 'cmdList', 'cmdListO', 'cmdCode', 'cmdQuote'],
				footer:'<small id="weatherDetailTextCounter" class="text-success">还可以输入 500 个字符。 </small>',
				onChange:function(e){
					var content = e.parseContent(), content_length = (content.match(/\n/g)||[]).length + content.length
					if (content_length > 500) {
						$('#weatherDetailTextCounter').removeClass('text-success').addClass('text-danger').html('已超出' + (content_length-500)+' 个字符。')
					} else {
						$('#weatherDetailTextCounter').removeClass('text-danger').addClass('text-success').html('还可以输入' + (500-content_length)+'  个字符。 ')
					}
				}
			})
		})
		function selectCityHandler(_this){
			var layerLoadDialog = layer.load(0, {shade: false});
			$.ajax({
				type : "post",
				url : 'weather/weatherDataAction.jspx',
				data : {
					cityCode : $(_this).val()
				},
				success : function(data) {
					layer.close(layerLoadDialog);
					template.helper("dateFormat", dateFormat);
					if(data.weather) {
						document.getElementById('weatherBaseBox').innerHTML = template('weatherBaseTemp', data.weather);
					}
					if(data.alarm) {
						document.getElementById('weatherAlarmBox').innerHTML = template('weatherAlarmTemp', data.alarm);
					}
				}
			});
		}
	</script>
</body>
</html>

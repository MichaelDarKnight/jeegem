﻿<!DOCTYPE html>
<html>
  <head>
    <title>编辑文章 —个人中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">

    <link rel="icon" type="image/ico" href="${basePath}/resources/assets/images/favicon.ico">
    <!-- Bootstrap -->
    <link href="${basePath}/resources/assets/css/vendor/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath}/resources/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${basePath}/resources/assets/css/vendor/animate/animate.css">
    <link type="text/css" rel="stylesheet" media="all" href="${basePath}/resources/assets/js/vendor/mmenu/css/jquery.mmenu.all.css">
    <link rel="stylesheet" href="${basePath}/resources/assets/js/vendor/videobackground/css/jquery.videobackground.css">
    <link rel="stylesheet" href="${basePath}/resources/assets/css/vendor/bootstrap-checkbox.css">
    <link rel="stylesheet" href="${basePath}/resources/assets/css/vendor/bootstrap/bootstrap-dropdown-multilevel.css">

    <link rel="stylesheet" href="${basePath}/resources/assets/js/vendor/summernote/css/summernote.css">
    <link rel="stylesheet" href="${basePath}/resources/assets/js/vendor/summernote/css/summernote-bs3.css">
    <link rel="stylesheet" href="${basePath}/resources/assets/js/vendor/chosen/css/chosen.min.css">
    <link rel="stylesheet" href="${basePath}/resources/assets/js/vendor/chosen/css/chosen-bootstrap.css">
    <link rel="stylesheet" href="${basePath}/resources/assets/js/vendor/datepicker/css/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="${basePath}/resources/assets/js/vendor/colorpicker/css/bootstrap-colorpicker.css">
    <link rel="stylesheet" href="${basePath}/resources/assets/js/vendor/colorpalette/bootstrap-colorpalette.css">

    <link href="${basePath}/resources/assets/css/minimal.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="${basePath}/common/html5shiv.js"></script>
      <script src="${basePath}/resources/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="bg-1">

    <!-- Preloader -->
    <div class="mask"><div id="loader"></div></div>
    <!--/Preloader -->

    <!-- Wrap all page content here -->
    <div id="wrap">

      <!-- Make page fluid -->
      <div class="row">
        
        <!-- Fixed navbar -->
        <@_navbar.navbar  4 42/>
        <!-- Fixed navbar end -->
        
        <!-- Page content -->
        <div id="content" class="col-md-12">
          
          <!-- page header -->
          <@_pageHeader.pageHeader  '文章管理' '编辑文章'/>
          <!-- /page header -->

          <!-- content main container -->
          <div class="main">

            <!-- row -->
           <div class="row">

              <!-- col 12 -->
              <div class="col-md-12 ">

                <!-- tile -->
                <section class="tile color transparent-black">

                  <!-- tile header -->
                  <div class="tile-header">
                    <h1><strong>编辑文章</strong></h1>
                    <div class="controls">
                      <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                      <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                      <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                  </div>
                  <!-- /tile header -->

                  <!-- tile body -->
                  <div class="tile-body">
                    
                    <form class="form-horizontal" role="form" id="theForm" method="post" action="${basePath}/article/save.shtml" enctype="multipart/form-data">
                      <input type="hidden" name="id" value="${article.id}"/>
                      <div class="form-group">
                        <label for="input01" class="col-sm-2 control-label">帖子标题</label>
                        <div class="col-sm-4">
                          <input type="text" class="form-control" id="input01" name="title" value="${article.title}">
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label for="input07" class="col-sm-2 control-label">文章类目</label>
                        <div class="col-sm-4" id="selectbox">
                          <select class="chosen-select chosen-transparent form-control" name="articleType.id" id="input07" parsley-trigger="change" parsley-required="true" parsley-error-container="#selectbox">
                            <option value="">选择文章类目
                            <#if articleTypes?exists && articleTypes?size gt 0 >
                            <#list articleTypes as item>
                            	<#if item.id==article.articleType.id>
                            	<option value="${item.id}" selected>${item.typeName}
                            	<#else>
                            	<option value="${item.id}">${item.typeName}
                            	</#if>
                            </#list>
                            </#if>
                          </select>
                        </div>
					</div>
					
					<div class="form-group">
                        <label class="col-sm-2 control-label">文章属性</label>
                        <div class="col-sm-2">
                          <div class="radio radio-transparent">
                            <input type="radio" name="slide" id="optionsRadios1" value="1" <#if 1==article.slide> checked </#if>>
                            <label for="optionsRadios1">Banner</label>
                          </div>
                          <div class="radio radio-transparent">
                            <input type="radio" name="slide" id="optionsRadios2" value="2" <#if 2==article.slide> checked </#if>>
                            <label for="optionsRadios2">幻灯</label>
                          </div>
                          <div class="radio radio-transparent">
                            <input type="radio" name="slide" id="optionsRadios3" value="3" <#if 3==article.slide> checked </#if>>
                            <label for="optionsRadios3">推荐</label>
                          </div>
                          <div class="radio radio-transparent">
                            <input type="radio" name="slide" id="optionsRadios4" value="4" <#if 4==article.slide> checked </#if>>
                            <label for="optionsRadios4">图文</label>
                          </div>
                        </div>
                      </div>
						
						<div class="form-group">
                        <label for="colorpicker-rgb" class="col-sm-2 control-label">幻灯图片</label>
                        <div class="col-sm-4">
                          <div class="input-group">
                            <span class="input-group-btn">
                              <span class="btn btn-primary btn-file">
                                <i class="fa fa-upload"></i><input type="file" multiple="" name="slideImageFile">
                              </span>
                            </span>
                            <input type="text" class="form-control" readonly="">
                          </div>
                        </div>
                      </div>
						
                      <div class="form-group">
                        <label for="input05" class="col-sm-2 control-label">文章摘要</label>
                        <div class="col-sm-4">
                          <textarea class="form-control" id="input05" name="summary" rows="6">${article.summary}</textarea>
                        </div>
                      </div>
						
                      <div class="form-group">
                        <label for="input04" class="col-sm-2 control-label">关键字</label>
                        <div class="col-sm-4">
                          <input type="text" class="form-control" name="keyWords" id="input04" placeholder="多个关键字用空格隔开" value="${article.keyWords}">
                        </div>
                      </div>
					  
					  <div class="form-group form-footer">
                        <div class="col-sm-offset-4 col-sm-2">
                          <button type="button" class="btn btn-primary" onclick="submitForm()">提交</button>
                          <button type="reset" class="btn btn-default">重置</button>
                        </div>
                      </div>
                      <div class="form-group">
                      	
                        <script id="editor" type="text/plain" style="width:100%;height:500px;"></script>
				   		<input type="hidden" id="editorContent" name="content"/>
                      </div>

                      

                    </form>

                  </div>
                  <!-- /tile body -->
                  
                
                </section>
                <!-- /tile -->

              </div>
              <!-- /col 6 -->


            </div>
            <!-- /row -->

          </div>

        </div>
        <!-- Page content end -->




        <div id="mmenu" class="right-panel">
          <!-- Nav tabs -->
          <ul class="nav nav-tabs nav-justified">
            <li class="active"><a href="#mmenu-users" data-toggle="tab"><i class="fa fa-users"></i></a></li>
            <li class=""><a href="#mmenu-history" data-toggle="tab"><i class="fa fa-clock-o"></i></a></li>
            <li class=""><a href="#mmenu-friends" data-toggle="tab"><i class="fa fa-heart"></i></a></li>
            <li class=""><a href="#mmenu-settings" data-toggle="tab"><i class="fa fa-gear"></i></a></li>
          </ul>
              
          <!-- Tab panes -->
          <div class="tab-content">
            <div class="tab-pane active" id="mmenu-users">
              <h5><strong>Online</strong> Users</h5>

              <ul class="users-list">
                
                <li class="online">
                  <div class="media">
                    <a class="pull-left profile-photo" href="#">
                      <img class="media-object" src="${basePath}/resources/assets/images/ici-avatar.jpg" alt="">
                    </a>
                    <div class="media-body">
                      <h6 class="media-heading">Ing. Imrich <strong>Kamarel</strong></h6>
                      <small><i class="fa fa-map-marker"></i> Ulaanbaatar, Mongolia</small>
                      <span class="badge badge-outline status"></span>
                    </div>
                  </div>
                </li>

                <li class="online">
                  <div class="media">
                    
                    <a class="pull-left profile-photo" href="#">
                      <img class="media-object" src="${basePath}/resources/assets/images/arnold-avatar.jpg" alt="">
                    </a>
                    <span class="badge badge-red unread">3</span>

                    <div class="media-body">
                      <h6 class="media-heading">Arnold <strong>Karlsberg</strong></h6>
                      <small><i class="fa fa-map-marker"></i> Bratislava, Slovakia</small>
                      <span class="badge badge-outline status"></span>
                    </div>

                  </div>
                </li>

                <li class="online">
                  <div class="media">
                    <a class="pull-left profile-photo" href="#">
                      <img class="media-object" src="${basePath}/resources/assets/images/peter-avatar.jpg" alt="">

                    </a>
                    <div class="media-body">
                      <h6 class="media-heading">Peter <strong>Kay</strong></h6>
                      <small><i class="fa fa-map-marker"></i> Kosice, Slovakia</small>
                      <span class="badge badge-outline status"></span>
                    </div>
                  </div>
                </li>

                <li class="online">
                  <div class="media">
                    <a class="pull-left profile-photo" href="#">
                      <img class="media-object" src="${basePath}/resources/assets/images/george-avatar.jpg" alt="">
                    </a>
                    <div class="media-body">
                      <h6 class="media-heading">George <strong>McCain</strong></h6>
                      <small><i class="fa fa-map-marker"></i> Prague, Czech Republic</small>
                      <span class="badge badge-outline status"></span>
                    </div>
                  </div>
                </li>

                <li class="busy">
                  <div class="media">
                    <a class="pull-left profile-photo" href="#">
                      <img class="media-object" src="${basePath}/resources/assets/images/random-avatar1.jpg" alt="">
                    </a>
                    <div class="media-body">
                      <h6 class="media-heading">Lucius <strong>Cashmere</strong></h6>
                      <small><i class="fa fa-map-marker"></i> Wien, Austria</small>
                      <span class="badge badge-outline status"></span>
                    </div>
                  </div>
                </li>

                <li class="busy">
                  <div class="media">
                    <a class="pull-left profile-photo" href="#">
                      <img class="media-object" src="${basePath}/resources/assets/images/random-avatar2.jpg" alt="">
                    </a>
                    <div class="media-body">
                      <h6 class="media-heading">Jesse <strong>Phoenix</strong></h6>
                      <small><i class="fa fa-map-marker"></i> Berlin, Germany</small>
                      <span class="badge badge-outline status"></span>
                    </div>
                  </div>
                </li>

              </ul>

              <h5><strong>Offline</strong> Users</h5>

              <ul class="users-list">
                
                <li class="offline">
                  <div class="media">
                    <a class="pull-left profile-photo" href="#">
                      <img class="media-object" src="${basePath}/resources/assets/images/random-avatar4.jpg" alt="">
                    </a>
                    <div class="media-body">
                      <h6 class="media-heading">Dell <strong>MacApple</strong></h6>
                      <small><i class="fa fa-map-marker"></i> Paris, France</small>
                      <span class="badge badge-outline status"></span>
                    </div>
                  </div>
                </li>

                <li class="offline">
                  <div class="media">
                    
                    <a class="pull-left profile-photo" href="#">
                      <img class="media-object" src="${basePath}/resources/assets/images/random-avatar5.jpg" alt="">
                    </a>

                    <div class="media-body">
                      <h6 class="media-heading">Roger <strong>Flopple</strong></h6>
                      <small><i class="fa fa-map-marker"></i> Rome, Italia</small>
                      <span class="badge badge-outline status"></span>
                    </div>
                    
                  </div>
                </li>

                <li class="offline">
                  <div class="media">
                    <a class="pull-left profile-photo" href="#">
                      <img class="media-object" src="${basePath}/resources/assets/images/random-avatar6.jpg" alt="">

                    </a>
                    <div class="media-body">
                      <h6 class="media-heading">Nico <strong>Vulture</strong></h6>
                      <small><i class="fa fa-map-marker"></i> Kyjev, Ukraine</small>
                      <span class="badge badge-outline status"></span>
                    </div>
                  </div>
                </li>

                <li class="offline">
                  <div class="media">
                    <a class="pull-left profile-photo" href="#">
                      <img class="media-object" src="${basePath}/resources/assets/images/random-avatar7.jpg" alt="">
                    </a>
                    <div class="media-body">
                      <h6 class="media-heading">Bobby <strong>Socks</strong></h6>
                      <small><i class="fa fa-map-marker"></i> Moscow, Russia</small>
                      <span class="badge badge-outline status"></span>
                    </div>
                  </div>
                </li>

                <li class="offline">
                  <div class="media">
                    <a class="pull-left profile-photo" href="#">
                      <img class="media-object" src="${basePath}/resources/assets/images/random-avatar8.jpg" alt="">
                    </a>
                    <div class="media-body">
                      <h6 class="media-heading">Anna <strong>Opichia</strong></h6>
                      <small><i class="fa fa-map-marker"></i> Budapest, Hungary</small>
                      <span class="badge badge-outline status"></span>
                    </div>
                  </div>
                </li>

              </ul>

            </div>

            <div class="tab-pane" id="mmenu-history">
              <h5><strong>Chat</strong> History</h5>

              <ul class="history-list">
                
                <li class="online">
                  <div class="media">
                    <a class="pull-left profile-photo" href="#">
                      <img class="media-object" src="${basePath}/resources/assets/images/ici-avatar.jpg" alt="">
                    </a>
                    <div class="media-body">
                      <h6 class="media-heading">Ing. Imrich <strong>Kamarel</strong></h6>
                      <small>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor</small>
                      <span class="badge badge-outline status"></span>
                    </div>
                  </div>
                </li>

                <li class="busy">
                  <div class="media">
                    
                    <a class="pull-left profile-photo" href="#">
                      <img class="media-object" src="${basePath}/resources/assets/images/arnold-avatar.jpg" alt="">
                    </a>
                    <span class="badge badge-red unread">3</span>

                    <div class="media-body">
                      <h6 class="media-heading">Arnold <strong>Karlsberg</strong></h6>
                      <small>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</small>
                      <span class="badge badge-outline status"></span>
                    </div>

                  </div>
                </li>

                <li class="offline">
                  <div class="media">
                    <a class="pull-left profile-photo" href="#">
                      <img class="media-object" src="${basePath}/resources/assets/images/peter-avatar.jpg" alt="">

                    </a>
                    <div class="media-body">
                      <h6 class="media-heading">Peter <strong>Kay</strong></h6>
                      <small>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit </small>
                      <span class="badge badge-outline status"></span>
                    </div>
                  </div>
                </li>

              </ul>
                
            </div>

            <div class="tab-pane" id="mmenu-friends">
              <h5><strong>Friends</strong> List</h5>
                <ul class="favourite-list">
                
                <li class="online">
                  <div class="media">
                    
                    <a class="pull-left profile-photo" href="#">
                      <img class="media-object" src="${basePath}/resources/assets/images/arnold-avatar.jpg" alt="">
                    </a>
                    <span class="badge badge-red unread">3</span>

                    <div class="media-body">
                      <h6 class="media-heading">Arnold <strong>Karlsberg</strong></h6>
                      <small><i class="fa fa-map-marker"></i> Bratislava, Slovakia</small>
                      <span class="badge badge-outline status"></span>
                    </div>

                  </div>
                </li>

                <li class="offline">
                  <div class="media">
                    <a class="pull-left profile-photo" href="#">
                      <img class="media-object" src="${basePath}/resources/assets/images/random-avatar8.jpg" alt="">
                    </a>
                    <div class="media-body">
                      <h6 class="media-heading">Anna <strong>Opichia</strong></h6>
                      <small><i class="fa fa-map-marker"></i> Budapest, Hungary</small>
                      <span class="badge badge-outline status"></span>
                    </div>
                  </div>
                </li>

                <li class="busy">
                  <div class="media">
                    <a class="pull-left profile-photo" href="#">
                      <img class="media-object" src="${basePath}/resources/assets/images/random-avatar1.jpg" alt="">
                    </a>
                    <div class="media-body">
                      <h6 class="media-heading">Lucius <strong>Cashmere</strong></h6>
                      <small><i class="fa fa-map-marker"></i> Wien, Austria</small>
                      <span class="badge badge-outline status"></span>
                    </div>
                  </div>
                </li>

                <li class="online">
                  <div class="media">
                    <a class="pull-left profile-photo" href="#">
                      <img class="media-object" src="${basePath}/resources/assets/images/ici-avatar.jpg" alt="">
                    </a>
                    <div class="media-body">
                      <h6 class="media-heading">Ing. Imrich <strong>Kamarel</strong></h6>
                      <small><i class="fa fa-map-marker"></i> Ulaanbaatar, Mongolia</small>
                      <span class="badge badge-outline status"></span>
                    </div>
                  </div>
                </li>

              </ul>
            </div>

            <div class="tab-pane pane-settings" id="mmenu-settings">
              <h5><strong>Chat</strong> Settings</h5>

              <ul class="settings">
               
                <li>
                  <div class="form-group">
                    <label class="col-xs-8 control-label">Show Offline Users</label>
                    <div class="col-xs-4 control-label">
                      <div class="onoffswitch greensea">
                        <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="show-offline" checked="">
                        <label class="onoffswitch-label" for="show-offline">
                          <span class="onoffswitch-inner"></span>
                          <span class="onoffswitch-switch"></span>
                        </label>
                      </div>
                    </div>
                  </div>
                </li>

                <li>
                  <div class="form-group">
                    <label class="col-xs-8 control-label">Show Fullname</label>
                    <div class="col-xs-4 control-label">
                      <div class="onoffswitch greensea">
                        <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="show-fullname">
                        <label class="onoffswitch-label" for="show-fullname">
                          <span class="onoffswitch-inner"></span>
                          <span class="onoffswitch-switch"></span>
                        </label>
                      </div>
                    </div>
                  </div>
                </li>

                <li>
                  <div class="form-group">
                    <label class="col-xs-8 control-label">History Enable</label>
                    <div class="col-xs-4 control-label">
                      <div class="onoffswitch greensea">
                        <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="show-history" checked="">
                        <label class="onoffswitch-label" for="show-history">
                          <span class="onoffswitch-inner"></span>
                          <span class="onoffswitch-switch"></span>
                        </label>
                      </div>
                    </div>
                  </div>
                </li>

                <li>
                  <div class="form-group">
                    <label class="col-xs-8 control-label">Show Locations</label>
                    <div class="col-xs-4 control-label">
                      <div class="onoffswitch greensea">
                        <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="show-location" checked="">
                        <label class="onoffswitch-label" for="show-location">
                          <span class="onoffswitch-inner"></span>
                          <span class="onoffswitch-switch"></span>
                        </label>
                      </div>
                    </div>
                  </div>
                </li>

                <li>
                  <div class="form-group">
                    <label class="col-xs-8 control-label">Notifications</label>
                    <div class="col-xs-4 control-label">
                      <div class="onoffswitch greensea">
                        <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="show-notifications">
                        <label class="onoffswitch-label" for="show-notifications">
                          <span class="onoffswitch-inner"></span>
                          <span class="onoffswitch-switch"></span>
                        </label>
                      </div>
                    </div>
                  </div>
                </li>

                <li>
                  <div class="form-group">
                    <label class="col-xs-8 control-label">Show Undread Count</label>
                    <div class="col-xs-4 control-label">
                      <div class="onoffswitch greensea">
                        <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="show-unread" checked="">
                        <label class="onoffswitch-label" for="show-unread">
                          <span class="onoffswitch-inner"></span>
                          <span class="onoffswitch-switch"></span>
                        </label>
                      </div>
                    </div>
                  </div>
                </li>

              </ul>
                
            </div><!-- tab-pane -->
              
          </div><!-- tab-content -->
        </div>






      </div>
      <!-- Make page fluid-->




    </div>
    <!-- Wrap all page content end -->



    <section class="videocontent" id="video"></section>



    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${basePath}/resources/jquery/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${basePath}/resources/assets/js/vendor/bootstrap/bootstrap.min.js"></script>
    <script src="${basePath}/resources/assets/js/vendor/bootstrap/bootstrap-dropdown-multilevel.js"></script>
    
    <script type="text/javascript" src="${basePath}/resources/assets/js/vendor/mmenu/js/jquery.mmenu.min.js"></script>
    <script type="text/javascript" src="${basePath}/resources/assets/js/vendor/sparkline/jquery.sparkline.min.js"></script>
    <script type="text/javascript" src="${basePath}/resources/assets/js/vendor/nicescroll/jquery.nicescroll.min.js"></script>
    <script type="text/javascript" src="${basePath}/resources/assets/js/vendor/animate-numbers/jquery.animateNumbers.js"></script>
    <script type="text/javascript" src="${basePath}/resources/assets/js/vendor/videobackground/jquery.videobackground.js"></script>
    <script type="text/javascript" src="${basePath}/resources/assets/js/vendor/blockui/jquery.blockUI.js"></script>

    <script src="${basePath}/resources/assets/js/vendor/summernote/summernote.min.js"></script>

    <script src="${basePath}/resources/assets/js/vendor/chosen/chosen.jquery.min.js"></script>

    <script src="${basePath}/resources/assets/js/vendor/momentjs/moment-with-langs.min.js"></script>
    <script src="${basePath}/resources/assets/js/vendor/datepicker/bootstrap-datetimepicker.min.js"></script>

    <script src="${basePath}/resources/assets/js/vendor/colorpicker/bootstrap-colorpicker.min.js"></script>

    <script src="${basePath}/resources/assets/js/vendor/colorpalette/bootstrap-colorpalette.js"></script>

	<script type="text/javascript" charset="utf-8" src="${basePath}/resources/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="${basePath}/resources/ueditor/editor_jeegem.js"> </script>
	<script type="text/javascript" charset="utf-8" src="${basePath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
	
    <script src="${basePath}/resources/assets/js/minimal.js"></script>
	<script src="${basePath}/js/common/jquery/jquery.form-2.82.js?${_v}"></script>
    <script  src="${basePath}/js/common/layer/layer.js"></script>
    
    <script>

    //initialize file upload button function
    $(document).on('change', '.btn-file :file', function() {
        var input = $(this),
        numFiles = input.get(0).files ? input.get(0).files.length : 1,
        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
        input.trigger('fileselect', [numFiles, label]);
    });


    $(function(){

      //load wysiwyg editor
      $('#input06').summernote({
        toolbar: [
          //['style', ['style']], // no style button
          ['style', ['bold', 'italic', 'underline', 'clear']],
          ['fontsize', ['fontsize']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['height', ['height']],
          //['insert', ['picture', 'link']], // no insert buttons
          //['table', ['table']], // no table button
          //['help', ['help']] //no help button
        ],
        height: 137   //set editable area's height
      });

      //chosen select input
      $(".chosen-select").chosen({disable_search_threshold: 10});

      //initialize datepicker
      $('#datepicker').datetimepicker({
        icons: {
          time: "fa fa-clock-o",
          date: "fa fa-calendar",
          up: "fa fa-arrow-up",
          down: "fa fa-arrow-down"
        }
      });

      $("#datepicker").on("dp.show",function (e) {
        var newtop = $('.bootstrap-datetimepicker-widget').position().top - 45;      
        $('.bootstrap-datetimepicker-widget').css('top', newtop + 'px');
      });

      //initialize colorpicker
      $('#colorpicker').colorpicker();

      $('#colorpicker').colorpicker().on('showPicker', function(e){
        var newtop = $('.dropdown-menu.colorpicker.colorpicker-visible').position().top - 45;      
        $('.dropdown-menu.colorpicker.colorpicker-visible').css('top', newtop + 'px');
      });

      //initialize colorpicker RGB
      $('#colorpicker-rgb').colorpicker({
        format: 'rgb'
      });

      $('#colorpicker-rgb').colorpicker().on('showPicker', function(e){
        var newtop = $('.dropdown-menu.colorpicker.colorpicker-visible').position().top - 45;      
        $('.dropdown-menu.colorpicker.colorpicker-visible').css('top', newtop + 'px');
      });

      //initialize file upload button
      $('.btn-file :file').on('fileselect', function(event, numFiles, label) {
        
        var input = $(this).parents('.input-group').find(':text'),
            log = numFiles > 1 ? numFiles + ' files selected' : label;

            console.log(log);
        
        if( input.length ) {
          input.val(log);
        } else {
          if( log ) alert(log);
        }
        
      });

      // Initialize colorpalette
      $('#event-colorpalette').colorPalette({ 
        colors:[['#428bca', '#5cb85c', '#5bc0de', '#f0ad4e' ,'#d9534f', '#ff4a43', '#22beef', '#a2d200', '#ffc100', '#cd97eb', '#16a085', '#FF0066', '#A40778', '#1693A5']] 
      }).on('selectColor', function(e) {
        var data = $(this).data();

        $(data.returnColor).val(e.color);
        $(this).parents(".input-group").css("border-bottom-color", e.color );
      });
      
    })
      
	//实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
      
      
      function submitForm(){
      	var editor=UE.getEditor('editor').getContent();
      	$("#editorContent").val(editor);
		$('#theForm').submit();
      }
      
    ue.addListener("ready",function(){
        //通过ajax请求数据
        UE.getEditor('editor').setContent('${article.content}');
    });
      
    </script>
    
    
    
  </body>
</html>
      
    <script src="js/jssor.slider-28.0.0.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        window.jssor_1_slider_init = function() {

            var jssor_1_SlideoTransitions = [
              [{b:-1,d:1,kX:16}],
              [{b:-1,d:1,y:200,rY:-360,sX:0.5,sY:0.5,p:{y:{o:32,d:1,dO:9},rY:{c:0}}},{b:0,d:3000,y:0,o:1,rY:0,sX:1,sY:1,e:{y:1,o:13,rY:1,sX:1,sY:1},p:{y:{dl:0},o:{dl:0.1,rd:3},rY:{dl:0.1,o:33},sX:{dl:0.1,o:33},sY:{dl:0.1,o:33}}}],
              [{b:-1,d:1,y:200,rY:-360,sX:0.5,sY:0.5,p:{y:{o:32,d:1,dO:9},rY:{c:0}}},{b:0,d:3000,y:0,o:1,rY:0,sX:1,sY:1,e:{y:1,o:13,rY:1,sX:1,sY:1},p:{y:{dl:0},o:{dl:0.1,rd:3},rY:{dl:0.1,o:33},sX:{dl:0.1,o:33},sY:{dl:0.1,o:33}}}],
              [{b:-1,d:1,y:100,rY:-360,sX:0.5,sY:0.5,p:{y:{o:32,d:1,dO:9},rY:{c:0}}},{b:0,d:3000,y:0,o:1,rY:0,sX:1,sY:1,e:{y:1,o:13,rY:1,sX:1,sY:1},p:{y:{dl:0},o:{dl:0.02,rd:3},rY:{dl:0.02,o:33},sX:{dl:0.02,o:33},sY:{dl:0.02,o:33}}}],
              [{b:2000,d:1000,y:50,e:{y:3}}],
              [{b:-1,d:1,bl:[8]},{b:2000,d:1000,bl:[3],e:{bl:3}}],
              [{b:-1,d:1,rp:1},{b:2000,d:1000,o:0.6},{b:2000,d:1000,rp:0}],
              [{b:-1,d:1,sX:0.7}],
              [{b:1000,d:2000,y:195,e:{y:3}}],
              [{b:600,d:2000,y:195,e:{y:3}}],
              [{b:1400,d:2000,y:195,e:{y:3}}],
              [{b:-1,d:1,sX:0.7,ls:2},{b:0,d:800,o:1,ls:0,e:{ls:6}}],
              [{b:-1,d:801,rp:1}],
              [{b:-1,d:1,kY:-6}],
              [{b:-1,d:1,x:30,kY:-10},{b:1400,d:1500,x:0,o:1,e:{x:27,o:6}}],
              [{b:-1,d:1,c:{t:0}},{b:1400,d:1500,c:{t:339},e:{c:{t:3}}}],
              [{b:-1,d:1,x:30,kY:-10},{b:1700,d:1500,x:0,o:1,e:{x:27,o:6}}],
              [{b:-1,d:1,c:{t:0}},{b:1700,d:1500,c:{t:339},e:{c:{t:3}}}],
              [{b:-1,d:1,sX:0.3,sY:0.3},{b:400,d:1000,o:1,sX:1,sY:1,e:{sX:3,sY:3}}],
              [{b:-1,d:1,sX:0.3,sY:0.3},{b:0,d:1800,x:-347,y:-94,o:1,sX:1,sY:1,e:{x:3,y:3,sX:3,sY:3}}],
              [{b:-1,d:1,sX:0.3,sY:0.3},{b:180,d:1520,x:-230,y:-217,o:1,sX:1,sY:1,e:{x:3,y:3,sX:3,sY:3}}],
              [{b:-1,d:1,sX:0.3,sY:0.3},{b:400,d:1500,x:-120,y:-179,o:1,sX:1,sY:1,e:{x:3,y:3,sX:3,sY:3}}],
              [{b:-1,d:1,sX:0.3,sY:0.3},{b:500,d:1600,x:120,y:-167,o:1,sX:1,sY:1,e:{x:3,y:3,sX:3,sY:3}}],
              [{b:-1,d:1,sX:0.3,sY:0.3},{b:800,d:800,x:301,y:-100,o:1,sX:1,sY:1,e:{x:3,y:3,sX:3,sY:3}}],
              [{b:-1,d:1,sX:0.3,sY:0.3},{b:600,d:1000,x:312,y:-92,o:1,sX:1,sY:1,e:{x:3,y:3,sX:3,sY:3}}],
              [{b:-1,d:1,sX:0.3,sY:0.3},{b:100,d:800,x:388,y:-161,o:1,sX:1,sY:1,e:{x:3,y:3,sX:3,sY:3}}]
            ];

            var jssor_1_options = {
              $AutoPlay: 1,
              $SlideDuration: 800,
              $SlideEasing: $Jease$.$OutQuint,
              $CaptionSliderOptions: {
                $Class: $JssorCaptionSlideo$,
                $Transitions: jssor_1_SlideoTransitions
              },
              $ArrowNavigatorOptions: {
                $Class: $JssorArrowNavigator$
              },
              $BulletNavigatorOptions: {
                $Class: $JssorBulletNavigator$,
                $SpacingX: 16,
                $SpacingY: 16
              }
            };

            var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

            /*#region responsive code begin*/

            var MAX_WIDTH = 1250;

            function ScaleSlider() {
                var containerElement = jssor_1_slider.$Elmt.parentNode;
                var containerWidth = containerElement.clientWidth;

                if (containerWidth) {

                    var expectedWidth = Math.min(MAX_WIDTH || containerWidth, containerWidth);

                    jssor_1_slider.$ScaleWidth(expectedWidth);
                }
                else {
                    window.setTimeout(ScaleSlider, 30);
                }
            }

            ScaleSlider();

            $Jssor$.$AddEvent(window, "load", ScaleSlider);
            $Jssor$.$AddEvent(window, "resize", ScaleSlider);
            $Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
            /*#endregion responsive code end*/
        };
    </script>
    <style>
        /*jssor slider loading skin spin css*/
        .jssorl-009-spin img {
            animation-name: jssorl-009-spin;
            animation-duration: 1.6s;
            animation-iteration-count: infinite;
            animation-timing-function: linear;
        }

        @keyframes jssorl-009-spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        /*jssor slider bullet skin 057 css*/
        .jssorb057 .i {position:absolute;cursor:pointer;}
        .jssorb057 .i .b {fill:none;stroke:#fff;stroke-width:2200;stroke-miterlimit:10;stroke-opacity:0.4;}
        .jssorb057 .i:hover .b {stroke-opacity:.7;}
        .jssorb057 .iav .b {stroke-opacity: 1;}
        .jssorb057 .i.idn {opacity:.3;}

        /*jssor slider arrow skin 051 css*/
        .jssora051 {display:block;position:absolute;cursor:pointer;}
        .jssora051 .a {fill:none;stroke:#fff;stroke-width:360;stroke-miterlimit:10;}
        .jssora051:hover {opacity:.8;}
        .jssora051.jssora051dn {opacity:.5;}
        .jssora051.jssora051ds {opacity:.3;pointer-events:none;}
    </style>
    <svg viewbox="0 0 0 0" width="0" height="0" style="display:block;position:relative;left:0px;top:0px;">
        <defs>
            <filter id="jssor_1_flt_1" x="-50%" y="-50%" width="200%" height="200%">
                <feGaussianBlur id="jssor_1_gbl_1" stddeviation="8" data-t="5"></feGaussianBlur>
            </filter>
            <mask id="jssor_1_msk_2">
                <path fill="#ffffff" d="M15.3,6.8C16.4,6.4 17.5,6 18.5,5.7C27.1,2.9 39-4.1 47.1,3.3C50.4,6.3 53.4,22.2 51.3,25.6C45.9,34.5 32.6,27.4 25.1,26.1C18.9,25 10.1,32.8 4.4,28.4C-5.6,20.7 8.9,9.3 15.3,6.8Z" x="0" y="0" style="position:absolute;overflow:visible;"></path>
            </mask>
            <filter id="jssor_1_flt_3" x="-50%" y="-50%" width="200%" height="200%">
                <feGaussianBlur stddeviation="2" result="r1"></feGaussianBlur>
                <feColorMatrix in="r1" type="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 3 -1" result="r2"></feColorMatrix>
            </filter>
            <filter id="jssor_1_flt_4" x="-50%" y="-50%" width="200%" height="200%">
                <feGaussianBlur stddeviation="10"></feGaussianBlur>
            </filter>
            <filter id="jssor_1_flt_5" x="-50%" y="-50%" width="200%" height="200%">
                <feGaussianBlur stddeviation="10"></feGaussianBlur>
            </filter>
            <filter id="jssor_1_flt_6" x="-50%" y="-50%" width="200%" height="200%">
                <feGaussianBlur stddeviation="10"></feGaussianBlur>
            </filter>
            <mask id="jssor_1_msk_8">
                <text data-to="130px 50px" fill="#ffffff" id="jssor_1_lyr_7" text-anchor="middle" x="130" y="100" data-t="11" style="position:absolute;opacity:0;font-family:Arial,Helvetica,sans-serif;font-size:130px;font-weight:900;letter-spacing:2em;overflow:visible;">juice
                </text>
            </mask>
        </defs>
    </svg>
    <div id="jssor_1" style="position:relative;margin:0 auto;top:0px;left:0px;width:1250px;height:400px;overflow:hidden;visibility:hidden;">
        <!-- Loading Screen -->
        <div data-u="loading" class="jssorl-009-spin" style="position:absolute;top:0px;left:0px;width:100%;height:100%;text-align:center;background-color:rgba(0,0,0,0.7);">
            <img style="margin-top:-19px;position:relative;top:50%;width:38px;height:38px;" src="img/spin.svg" />
        </div>
        <div data-u="slides" style="cursor:default;position:relative;top:0px;left:0px;width:1250px;height:400px;overflow:hidden;">
            <!-- slide begin -->
			<!-- slide begin -->
			<!-- slide begin -->
			<div data-p="680">
                <a href="#"><img data-u="image" src="slide/slidehat.jpg"  border="0" />
                <div data-to="50% 50%" data-ts="flat" data-p="680" data-po="80% 50%" data-t="0" >
				</div>
				</a>
            </div>
			
			<!-- slide begin -->
			<!-- slide begin -->
			<!-- slide begin -->
        </div>
        <!-- Bullet Navigator -->
        <div data-u="navigator" class="jssorb057" style="position:absolute;bottom:16px;right:16px;" data-autocenter="1" data-scale="0.5" data-scale-bottom="0.75">
            <div data-u="prototype" class="i" style="width:14px;height:14px;">
                <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                    <circle class="b" cx="8000" cy="8000" r="5000"></circle>
                </svg>
            </div>
        </div>
        <!-- Arrow Navigator -->
        <div data-u="arrowleft" class="jssora051" style="width:65px;height:65px;top:0px;left:25px;" data-autocenter="2" data-scale="0.75" data-scale-left="0.75">
            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                <polyline class="a" points="11040,1920 4960,8000 11040,14080 "></polyline>
            </svg>
        </div>
        <div data-u="arrowright" class="jssora051" style="width:65px;height:65px;top:0px;right:25px;" data-autocenter="2" data-scale="0.75" data-scale-right="0.75">
            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                <polyline class="a" points="4960,1920 11040,8000 4960,14080 "></polyline>
            </svg>
        </div>
    </div>
    <script type="text/javascript">jssor_1_slider_init();
    </script>
    <!-- #endregion Jssor Slider End -->


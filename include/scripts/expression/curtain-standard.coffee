###
# Expression Template:
# Standard Curtain Element
# 
# An all-purpose curtain element. Features an SVG loading graphic that changes according to the loading statuas.
# The effect manifests changes in the loading graphic
# 
###

module.exports =
    standard:
        template: """
                <style type="text/css">
                    .go-clockwise {
                      -webkit-animation: clockwise 9s infinite linear;
                      -moz-animation: clockwise 9s infinite linear;
                    }

                    .go-counter-clockwise {
                      -webkit-animation: counter-clockwise 9s infinite linear;
                      -moz-animation: counter-clockwise 9s infinite linear;
                    }
                    
                    .loading-band {
                        transform-origin: 0 0 0;
                    }

                    @-webkit-keyframes clockwise {
                      0% {
                        -webkit-transform: rotate(0deg);
                        -moz-transform: rotate(0deg);
                        -ms-transform: rotate(0deg);
                        -o-transform: rotate(0deg);
                        transform: rotate(0deg);
                        -webkit-transform-origin: center center;
                        -moz-transform-origin: center center;
                        transform-origin: center center;

                      }

                      100% {
                        -webkit-transform: rotate(360deg);
                        -moz-transform: rotate(360deg);
                        -ms-transform: rotate(360deg);
                        -o-transform: rotate(360deg);
                        transform: rotate(360deg);
                        -webkit-transform-origin: center center;
                        -moz-transform-origin: center center;
                        transform-origin: center center;

                      }
                    }

                    @-moz-keyframes clockwise {
                      0% {
                        -webkit-transform: rotate(0deg);
                        -moz-transform: rotate(0deg);
                        -ms-transform: rotate(0deg);
                        -o-transform: rotate(0deg);
                        transform: rotate(0deg);
                        -webkit-transform-origin: center center;
                        -moz-transform-origin: center center;
                        transform-origin: center center;

                      }

                      100% {
                        -webkit-transform: rotate(360deg);
                        -moz-transform: rotate(360deg);
                        -ms-transform: rotate(360deg);
                        -o-transform: rotate(360deg);
                        transform: rotate(360deg);
                        -webkit-transform-origin: center center;
                        -moz-transform-origin: center center;
                        transform-origin: center center;

                      }
                    }

                    @-webkit-keyframes counter-clockwise {
                      0% {
                        -webkit-transform: rotate(0deg);
                        -moz-transform: rotate(0deg);
                        -ms-transform: rotate(0deg);
                        -o-transform: rotate(0deg);
                        transform: rotate(0deg);
                        -webkit-transform-origin: center center;
                        -moz-transform-origin: center center;
                        transform-origin: center center;

                      }

                      100% {
                        -webkit-transform: rotate(-360deg);
                        -moz-transform: rotate(-360deg);
                        -ms-transform: rotate(-360deg);
                        -o-transform: rotate(-360deg);
                        transform: rotate(-360deg);
                        -webkit-transform-origin: center center;
                        -moz-transform-origin: center center;
                        transform-origin: center center;

                      }
                    }

                    @-moz-keyframes counter-clockwise {
                      0% {
                        -webkit-transform: rotate(0deg);
                        -moz-transform: rotate(0deg);
                        -ms-transform: rotate(0deg);
                        -o-transform: rotate(0deg);
                        transform: rotate(0deg);
                        -webkit-transform-origin: center center;
                        -moz-transform-origin: center center;
                        transform-origin: center center;

                      }

                      100% {
                        -webkit-transform: rotate(-360deg);
                        -moz-transform: rotate(-360deg);
                        -ms-transform: rotate(-360deg);
                        -o-transform: rotate(-360deg);
                        transform: rotate(-360deg);
                        -webkit-transform-origin: center center;
                        -moz-transform-origin: center center;
                        transform-origin: center center;
                      }
                    }                
                </style>
                <div style="width: 100%; height: 100%" ng-style="autofit()">
                    <svg 
                        xmlns="http://www.w3.org/2000/svg" 
                        x="0px"
                        y="0px"
                        width="1680"
                        height="1050"
                        style="display: none;"
                    >
                        <defs>
                            <filter id="loadingTextHighlightFilter"><feGaussianBlur id="gbFilter01" stdDeviation="8" /></filter>
                        </defs> 
                        <g class="loading-band-outer-holder" style="transform: translate(840.5px, 525.5px)">
                            <g class="loading-band-inner-holder go-clockwise">
                                <circle class="loading-band"
                                    cx="840.5" 
                                    cy="525.5" 
                                    r="400" 
                                    style="fill:none;stroke:#ffffff;stroke-width:64;stroke-dasharray:2550;stroke-dashoffset:2549.99;transform: translate(-840.5px, -525.5px)" 
                                    id="circle4" 
                                />
                            </g>
                        </g>
                      <circle class="outer-band"
                         id="circle3016"
                         style="fill:none;stroke:#ffffff;stroke-width:8"
                         r="460"
                         cy="525.5"
                         cx="840.5" />
                      <g 
                         style="filter:url(#loadingTextHighlightFilter);"
                         class="blureffect-loading"> 
                        <path 
                           d="m 689.4896,567.54199 -38.61585,0 0,-84.97638 9.46572,0 0,76.909 29.15013,0 0,8.06738" 
                           style="stroke:none;stroke-opacity:1;stroke-width:3;stroke-miterlimit:4;stroke-dasharray:none;fill:#ffffff;fill-opacity:1" 
                           id="path7979" /> 
                        <path 
                           d="m 701.96715,541.78017 0,-33.5603 c -10e-6,-9.28638 1.93616,-16.08089 5.80851,-20.38357 3.87232,-4.30252 8.89202,-6.45382 15.0591,-6.4539 6.16703,8e-5 11.18673,2.15138 15.05911,6.4539 3.87229,4.30268 5.80846,11.09719 5.80851,20.38357 l 0,33.5603 c -5e-5,9.28646 -1.93622,16.08098 -5.80851,20.38357 -3.87238,4.3026 -8.89208,6.4539 -15.05911,6.4539 -6.16708,-0.0359 -11.18678,-2.18715 -15.0591,-6.4539 -3.87235,-4.30259 -5.80852,-11.09711 -5.80851,-20.38357 m 9.5195,0 c -2e-5,6.99174 0.986,11.77838 2.95804,14.35993 2.00786,2.58157 4.78662,3.87235 8.33629,3.87234 3.54962,10e-6 6.32838,-1.29077 8.33629,-3.87234 2.0437,-2.6174 3.06557,-7.40404 3.06561,-14.35993 l 0,-33.5603 c -4e-5,-6.9558 -1.02191,-11.72451 -3.06561,-14.30615 -2.00791,-2.61734 -4.78667,-3.92604 -8.33629,-3.92612 -3.54967,8e-5 -6.32843,1.29086 -8.33629,3.87234 -1.97204,2.58163 -2.95806,7.36827 -2.95804,14.35993 l 0,33.5603" 
                           style="stroke:none;stroke-opacity:1;stroke-width:3;stroke-miterlimit:4;stroke-dasharray:none;fill:#ffffff;fill-opacity:1" 
                           id="path7981" /> 
                        <path 
                           d="m 766.88265,562.80913 0,4.73286 -9.46572,0 0,-4.73286 c -10e-6,-8.13907 2.4202,-21.83568 7.26064,-41.08984 l 9.8422,-39.15368 10.64893,0 9.84221,39.15368 c 4.84037,19.25416 7.26058,32.95077 7.26064,41.08984 l 0,4.73286 -9.46573,0 0,-4.73286 c -4e-5,-3.83648 -0.53786,-8.89203 -1.61347,-15.16667 l -22.75001,0 c -1.03981,6.27464 -1.55971,11.33019 -1.55969,15.16667 m 12.96159,-65.18441 -7.04551,29.36525 c -1.11153,4.55363 -2.06169,8.74866 -2.85048,12.58511 l 19.73819,0 c -0.78885,-3.83645 -1.72108,-8.03148 -2.79669,-12.58511 l -7.04551,-29.36525" 
                           style="stroke:none;stroke-opacity:1;stroke-width:3;stroke-miterlimit:4;stroke-dasharray:none;fill:#ffffff;fill-opacity:1" 
                           id="path7983" /> 
                        <path 
                           d="m 859.98019,532.69092 c -5e-5,11.07922 -2.54576,19.66649 -7.63712,25.76183 -5.0556,6.0595 -11.92182,9.08924 -20.59871,9.08924 l -14.03723,0 0,-84.97638 14.03723,0 c 8.67689,9e-5 15.54311,2.86849 20.59871,8.60521 5.09136,5.70101 7.63707,14.07315 7.63712,25.11643 l 0,16.40367 m -9.78842,0 0,-16.40367 c -4e-5,-8.67685 -1.64937,-15.11282 -4.94799,-19.30792 -3.2987,-4.23082 -7.7985,-6.34626 -13.49942,-6.34634 l -4.62529,0 0,68.84162 4.62529,0 c 5.70092,10e-6 10.20072,-2.24092 13.49942,-6.72281 3.29862,-4.51771 4.94795,-11.20467 4.94799,-20.06088" 
                           style="stroke:none;stroke-opacity:1;stroke-width:3;stroke-miterlimit:4;stroke-dasharray:none;fill:#ffffff;fill-opacity:1" 
                           id="path7985" /> 
                        <path 
                           d="m 911.98789,567.54199 -36.3032,0 0,-8.06738 13.39185,0 0,-68.84162 -10.54138,0 0,-8.06738 30.60225,0 0,8.06738 -10.54137,0 0,68.84162 13.39185,0 0,8.06738" 
                           style="stroke:none;stroke-opacity:1;stroke-width:3;stroke-miterlimit:4;stroke-dasharray:none;fill:#ffffff;fill-opacity:1" 
                           id="path7987" /> 
                        <path 
                           d="m 971.31001,567.54199 -8.71277,0 -0.75295,-25.70804 -24.09457,-46.03784 2.1513,43.40249 0,28.34339 -9.46572,0 0,-84.97638 9.46572,0 24.09457,46.03784 -2.1513,-43.40249 0,-2.63535 9.46572,0 0,84.97638" 
                           style="stroke:none;stroke-opacity:1;stroke-width:3;stroke-miterlimit:4;stroke-dasharray:none;fill:#ffffff;fill-opacity:1" 
                           id="path7989" /> 
                        <path 
                           d="m 1029.1262,541.78017 c 0,9.28646 -2.0258,16.08098 -6.0774,20.38357 -4.0158,4.3026 -9.0714,6.4539 -15.1667,6.4539 -6.0954,0 -11.11506,-2.1513 -15.05909,-6.4539 -3.94406,-4.30259 -5.91608,-11.09711 -5.91608,-20.38357 l 0,-33.5603 c 0,-9.28638 1.97202,-16.08089 5.91608,-20.38357 3.97989,-4.30252 9.19679,-6.45382 15.65069,-6.4539 8.641,8e-5 15.2384,4.58952 19.792,13.76832 l -7.7447,4.67908 c -2.8326,-6.56139 -6.8304,-9.84212 -11.9935,-9.8422 -3.8365,8e-5 -6.8304,1.29086 -8.98168,3.87234 -2.11546,2.58163 -3.17318,7.36827 -3.17316,14.35993 l 0,33.5603 c -2e-5,6.99174 1.02185,11.77838 3.0656,14.35993 2.04374,2.58157 4.85834,3.87235 8.44384,3.87234 3.5138,10e-6 6.3463,-1.29077 8.4977,-3.87234 2.1871,-2.6174 3.2806,-7.40404 3.2807,-14.35993 l 0,-11.61703 -10.0573,0 0,-8.06738 19.523,0 0,19.68441" 
                           style="stroke:none;stroke-opacity:1;stroke-width:3;stroke-miterlimit:4;stroke-dasharray:none;fill:#ffffff;fill-opacity:1" 
                           id="path7991" /> 
                      </g> 
                      <g class="text-loading"> 
                        <path 
                           connector-curvature="0" 
                           d="m 689.4896,567.54199 -38.61585,0 0,-84.97638 9.46572,0 0,76.909 29.15013,0 0,8.06738" 
                           style="font-size:110.14659881999999413px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:none;stroke:#ffffff;stroke-width:3;stroke-miterlimit:3.79999995000000013;stroke-opacity:1;stroke-dasharray:0,6;stroke-dashoffset:0;fill-opacity:1" 
                           id="path7979-4" /> 
                        <path 
                           connector-curvature="0" 
                           d="m 701.96715,541.78017 0,-33.5603 c -10e-6,-9.28638 1.93616,-16.08089 5.80851,-20.38357 3.87232,-4.30252 8.89202,-6.45382 15.0591,-6.4539 6.16703,8e-5 11.18673,2.15138 15.05911,6.4539 3.87229,4.30268 5.80846,11.09719 5.80851,20.38357 l 0,33.5603 c -5e-5,9.28646 -1.93622,16.08098 -5.80851,20.38357 -3.87238,4.3026 -8.89208,6.4539 -15.05911,6.4539 -6.16708,-0.0359 -11.18678,-2.18715 -15.0591,-6.4539 -3.87235,-4.30259 -5.80852,-11.09711 -5.80851,-20.38357 m 9.5195,0 c -2e-5,6.99174 0.986,11.77838 2.95804,14.35993 2.00786,2.58157 4.78662,3.87235 8.33629,3.87234 3.54962,10e-6 6.32838,-1.29077 8.33629,-3.87234 2.0437,-2.6174 3.06557,-7.40404 3.06561,-14.35993 l 0,-33.5603 c -4e-5,-6.9558 -1.02191,-11.72451 -3.06561,-14.30615 -2.00791,-2.61734 -4.78667,-3.92604 -8.33629,-3.92612 -3.54967,8e-5 -6.32843,1.29086 -8.33629,3.87234 -1.97204,2.58163 -2.95806,7.36827 -2.95804,14.35993 l 0,33.5603" 
                           style="font-size:110.14659881999999413px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:none;stroke:#ffffff;stroke-width:3;stroke-miterlimit:3.79999995000000013;stroke-opacity:1;stroke-dasharray:0,6;stroke-dashoffset:0;fill-opacity:1" 
                           id="path7981-2" /> 
                        <path 
                           connector-curvature="0" 
                           d="m 766.88265,562.80913 0,4.73286 -9.46572,0 0,-4.73286 c -10e-6,-8.13907 2.4202,-21.83568 7.26064,-41.08984 l 9.8422,-39.15368 10.64893,0 9.84221,39.15368 c 4.84037,19.25416 7.26058,32.95077 7.26064,41.08984 l 0,4.73286 -9.46573,0 0,-4.73286 c -4e-5,-3.83648 -0.53786,-8.89203 -1.61347,-15.16667 l -22.75001,0 c -1.03981,6.27464 -1.55971,11.33019 -1.55969,15.16667 m 12.96159,-65.18441 -7.04551,29.36525 c -1.11153,4.55363 -2.06169,8.74866 -2.85048,12.58511 l 19.73819,0 c -0.78885,-3.83645 -1.72108,-8.03148 -2.79669,-12.58511 l -7.04551,-29.36525" 
                           style="font-size:110.14659881999999413px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:none;stroke:#ffffff;stroke-width:3;stroke-miterlimit:3.79999995000000013;stroke-opacity:1;stroke-dasharray:0,6;stroke-dashoffset:0;fill-opacity:1" 
                           id="path7983-0" /> 
                        <path 
                           connector-curvature="0" 
                           d="m 859.98019,532.69092 c -5e-5,11.07922 -2.54576,19.66649 -7.63712,25.76183 -5.0556,6.0595 -11.92182,9.08924 -20.59871,9.08924 l -14.03723,0 0,-84.97638 14.03723,0 c 8.67689,9e-5 15.54311,2.86849 20.59871,8.60521 5.09136,5.70101 7.63707,14.07315 7.63712,25.11643 l 0,16.40367 m -9.78842,0 0,-16.40367 c -4e-5,-8.67685 -1.64937,-15.11282 -4.94799,-19.30792 -3.2987,-4.23082 -7.7985,-6.34626 -13.49942,-6.34634 l -4.62529,0 0,68.84162 4.62529,0 c 5.70092,10e-6 10.20072,-2.24092 13.49942,-6.72281 3.29862,-4.51771 4.94795,-11.20467 4.94799,-20.06088" 
                           style="font-size:110.14659881999999413px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:none;stroke:#ffffff;stroke-width:3;stroke-miterlimit:3.79999995000000013;stroke-opacity:1;stroke-dasharray:0,6;stroke-dashoffset:0;fill-opacity:1" 
                           id="path7985-1" /> 
                        <path 
                           connector-curvature="0" 
                           d="m 911.98789,567.54199 -36.3032,0 0,-8.06738 13.39185,0 0,-68.84162 -10.54138,0 0,-8.06738 30.60225,0 0,8.06738 -10.54137,0 0,68.84162 13.39185,0 0,8.06738" 
                           style="font-size:110.14659881999999413px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:none;stroke:#ffffff;stroke-width:3;stroke-miterlimit:3.79999999999999982;stroke-opacity:1;stroke-dasharray:0,6;stroke-dashoffset:0;fill-opacity:1" 
                           id="path7987-0" /> 
                        <path 
                           connector-curvature="0" 
                           d="m 971.31001,567.54199 -8.71277,0 -0.75295,-25.70804 -24.09457,-46.03784 2.1513,43.40249 0,28.34339 -9.46572,0 0,-84.97638 9.46572,0 24.09457,46.03784 -2.1513,-43.40249 0,-2.63535 9.46572,0 0,84.97638" 
                           style="font-size:110.14659881999999413px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:none;stroke:#ffffff;stroke-width:3;stroke-miterlimit:3.79999995000000013;stroke-opacity:1;stroke-dasharray:0,6;stroke-dashoffset:0;fill-opacity:1" 
                           id="path7989-8" /> 
                        <path 
                           connector-curvature="0" 
                           d="m 1029.1262,541.78017 c 0,9.28646 -2.0258,16.08098 -6.0774,20.38357 -4.0158,4.3026 -9.0714,6.4539 -15.1667,6.4539 -6.0954,0 -11.11506,-2.1513 -15.05909,-6.4539 -3.94406,-4.30259 -5.91608,-11.09711 -5.91608,-20.38357 l 0,-33.5603 c 0,-9.28638 1.97202,-16.08089 5.91608,-20.38357 3.97989,-4.30252 9.19679,-6.45382 15.65069,-6.4539 8.641,8e-5 15.2384,4.58952 19.792,13.76832 l -7.7447,4.67908 c -2.8326,-6.56139 -6.8304,-9.84212 -11.9935,-9.8422 -3.8365,8e-5 -6.8304,1.29086 -8.98168,3.87234 -2.11546,2.58163 -3.17318,7.36827 -3.17316,14.35993 l 0,33.5603 c -2e-5,6.99174 1.02185,11.77838 3.0656,14.35993 2.04374,2.58157 4.85834,3.87235 8.44384,3.87234 3.5138,10e-6 6.3463,-1.29077 8.4977,-3.87234 2.1871,-2.6174 3.2806,-7.40404 3.2807,-14.35993 l 0,-11.61703 -10.0573,0 0,-8.06738 19.523,0 0,19.68441" 
                           style="font-size:110.14659881999999413px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:none;stroke:#ffffff;stroke-width:3;stroke-miterlimit:3.79999995000000013;stroke-opacity:1;stroke-dasharray:0,6;stroke-dashoffset:0;fill-opacity:1" 
                           id="path7991-4" /> 
                      </g> 
                      <g class="text-complete" style="fill:#ffffff;display:none;"> 
                        <path 
                           d="m 757.47848,639.99275 c -2.47353,4.02154 -5.81359,6.03231 -10.0202,6.03231 -3.39897,0 -6.04915,-0.95911 -7.95054,-2.87734 -1.88458,-1.91822 -2.82686,-5.56957 -2.82686,-10.95407 l 0,-13.47805 c 0,-5.01427 0.96752,-8.53943 2.90258,-10.57547 1.93504,-2.03597 4.55998,-3.05398 7.87482,-3.05402 4.20661,4e-5 7.54667,2.01081 10.0202,6.03231 l -5.27512,3.60929 c -1.24518,-2.27155 -2.82688,-3.40733 -4.74508,-3.40737 -1.29566,4e-5 -2.24636,0.47959 -2.8521,1.43867 -0.60577,0.94232 -0.90864,2.62497 -0.90863,5.04796 l 0,15.52247 c -10e-6,2.40621 0.30286,4.08886 0.90863,5.04796 0.60574,0.95912 1.55644,1.43868 2.8521,1.43867 1.9182,1e-5 3.4999,-1.1442 4.74508,-3.43261 l 5.27512,3.60929" 
                           id="path8183" /> 
                        <path 
                           d="m 782.64255,632.72369 c -2e-5,5.03114 -0.95072,8.50581 -2.8521,10.42403 -1.90141,1.91823 -4.38332,2.87734 -7.44574,2.87734 -3.06243,0 -5.54435,-0.95911 -7.44574,-2.87734 -1.9014,-1.91822 -2.8521,-5.39289 -2.85209,-10.42403 l 0,-14.31097 c -10e-6,-5.0311 0.95069,-8.50577 2.85209,-10.42403 1.90139,-1.93501 4.38331,-2.90254 7.44574,-2.90258 3.06242,4e-5 5.54433,0.96757 7.44574,2.90258 1.90138,1.91826 2.85208,5.39293 2.8521,10.42403 l 0,14.31097 m -7.01666,0.85815 0,-16.02727 c -2e-5,-2.22107 -0.21876,-3.81118 -0.65624,-4.77032 -0.4375,-0.95908 -1.32089,-1.43864 -2.65018,-1.43867 -1.3293,3e-5 -2.20428,0.47959 -2.62493,1.43867 -0.42068,0.94232 -0.63101,2.53242 -0.631,4.77032 l 0,16.02727 c -10e-6,2.20429 0.21874,3.78598 0.65624,4.74508 0.43747,0.95912 1.32087,1.43868 2.65017,1.43867 1.32929,10e-6 2.20426,-0.47114 2.62494,-1.41343 0.42065,-0.9591 0.63098,-2.54921 0.631,-4.77032" 
                           id="path8185" /> 
                        <path 
                           d="m 799.0989,618.94276 4.01312,-13.30137 6.43615,0 0,39.87887 -6.43615,0 0,-6.23423 c -10e-6,-6.96617 0.67305,-16.21234 2.01919,-27.73853 l -4.64412,15.29532 -2.77638,0 -4.64412,-15.29532 c 1.34611,11.52619 2.01917,20.77236 2.01918,27.73853 l 0,6.23423 -6.43615,0 0,-39.87887 6.43615,0 4.01313,13.30137" 
                           id="path8187" /> 
                        <path 
                           d="m 837.66531,617.55457 c -3e-5,2.89419 -0.95073,5.30879 -2.8521,7.24382 -1.90142,1.91824 -4.3665,2.87736 -7.39526,2.87734 l -3.18022,0 0,17.84453 -7.01666,0 0,-39.87887 10.19688,0 c 3.38211,4e-5 5.93133,0.96756 7.64766,2.90257 1.73311,1.91826 2.59967,4.31604 2.5997,7.19335 l 0,1.81726 m -7.01667,-0.22716 0,-1.36295 c -2e-5,-1.161 -0.26924,-2.179 -0.80767,-3.05401 -0.52164,-0.87495 -1.5144,-1.31244 -2.9783,-1.31247 l -2.62494,0 0,10.09592 2.62494,0 c 1.29563,2e-5 2.24633,-0.3954 2.8521,-1.18627 0.62256,-0.79082 0.93385,-1.8509 0.93387,-3.18022" 
                           id="path8189" /> 
                        <path 
                           d="m 864.14185,645.52026 -19.88896,0 0,-39.87887 7.01666,0 0,33.8718 12.8723,0 0,6.00707" 
                           id="path8191" /> 
                        <path 
                           d="m 889.81073,645.52026 -19.88896,0 0,-39.87887 19.88896,0 0,6.00707 -12.8723,0 0,9.99496 9.23777,0 0,6.00707 -9.23777,0 0,11.8627 12.8723,0 0,6.00707" 
                           id="path8193" /> 
                        <path 
                           d="m 917.0697,611.64846 -7.44574,0 0,33.8718 -7.01666,0 0,-33.8718 -7.44574,0 0,-6.00707 21.90814,0 0,6.00707" 
                           id="path8195" /> 
                        <path 
                           d="m 943.31909,645.52026 -19.88896,0 0,-39.87887 19.88896,0 0,6.00707 -12.8723,0 0,9.99496 9.23777,0 0,6.00707 -9.23777,0 0,11.8627 12.8723,0 0,6.00707" 
                           id="path8197" /> 
                      </g> 
                    </svg>
                </div>
            """

        effect:
            generate: (params) ->
                fx = (fxParams) ->
                    if params and params.hooks and typeof params.hooks.start is 'function'
                        params.hooks.start fxParams

                    fxParams.element.find("svg").css 'display', 'block'
                    
                    # animate the drawn portion of the loading band proportionate to the portion of loading complete
                    fxParams.element.find("circle.loading-band").css 'stroke-dashoffset', (2549.99 - (2549.99 * fxParams.transData.portion))

                    # animate dashed lettering stroke, another indicator of load progress and time passage
                    fxParams.element.find("g.text-loading path").css 'stroke-dasharray', (24 * fxParams.transData.portion ) + "," + (6 - (6 * fxParams.transData.portion ))
                    fxParams.element.find("g.text-loading path").css 'stroke-dashoffset', (fxParams.transData.time / 240)

                    document.getElementById("gbFilter01").setAttribute 'stdDeviation', (12 - (12 * fxParams.transData.portion ))
                    if fxParams.transData.completed >= fxParams.transData.total
                        fxParams.element.find("g.text-complete").css 'display', 'block'
                    
                    fxParams.element.find("svg").css 'opacity', (fxParams.transData.curtain.appeared - fxParams.transData.curtain.risen)

                    if params and params.hooks and typeof params.hooks.end is 'function'
                        params.hooks.end fxParams
                fx


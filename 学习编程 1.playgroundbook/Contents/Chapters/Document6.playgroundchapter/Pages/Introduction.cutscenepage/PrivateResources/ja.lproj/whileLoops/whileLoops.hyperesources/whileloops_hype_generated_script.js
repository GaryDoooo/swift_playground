//	HYPE.documents["whileLoops"]

(function(){(function k(){function l(a,b,d){var c=!1;null==window[a]&&(null==window[b]?(window[b]=[],window[b].push(k),a=document.getElementsByTagName("head")[0],b=document.createElement("script"),c=h,false==!0&&(c=""),b.type="text/javascript",b.src=c+"/"+d,a.appendChild(b)):window[b].push(k),c=!0);return c}var h="whileLoops.hyperesources",c="whileLoops",e="whileloops_hype_container";if(false==!1)try{for(var f=document.getElementsByTagName("script"),
a=0;a<f.length;a++){var b=f[a].src,d=null!=b?b.indexOf("/whileloops_hype_generated_script.js"):-1;if(-1!=d){h=b.substr(0,d);break}}}catch(n){}if(false==!1&&(a=navigator.userAgent.match(/MSIE (\d+\.\d+)/),a=parseFloat(a&&a[1])||null,a=l("HYPE_584","HYPE_dtl_584",!0==(null!=a&&10>a||false==!0)?"HYPE-584.full.min.js":"HYPE-584.thin.min.js"),false==!0&&(a=a||l("HYPE_w_584","HYPE_wdtl_584","HYPE-584.waypoints.min.js")),a))return;f=window.HYPE.documents;
if(null!=f[c]){b=1;a=c;do c=""+a+"-"+b++;while(null!=f[c]);d=document.getElementsByTagName("div");b=!1;for(a=0;a<d.length;a++)if(d[a].id==e&&null==d[a].getAttribute("HYP_dn")){var b=1,g=e;do e=""+g+"-"+b++;while(null!=document.getElementById(e));d[a].id=e;b=!0;break}if(!1==b)return}b=[];b=[{name:"init",source:"function(hypeDocument, element, event) {\t\t\n\t// First keyframe should always include axInit();\n\taxInit(hypeDocument.documentName());\n\t\n\t\n\tdocument.title = \"While Loops\";\n\t\n\tvar axContents = '';\n\taxContents += '<h1 role=\"text\" style=\"top: 240px;\">While Loops</h1>';\n\taxContents += '<p role=\"text\" style=\"top: 482px;\">Are we there yet?</p>';\n\t\n\treplaceAccessibilityContents(axContents);\n\n\thideAllWithSelector_exceptElementsWithSelector_('.axhidden, .controls', '#controls-page-1');\n\n\t\n}",identifier:"1061"},{name:"whileLoops",source:"function(hypeDocument, element, event) {\tdocument.title = \"While Loops\";\n\t\n\tvar axContents = '';\n\taxContents += '<h1 role=\"text\" style=\"top: 220px;\">While Loops</h1>';\n\taxContents += '<p role=\"text\" style=\"top: 450px;\">Are we there yet?</p>';\n\n\t\n\treplaceAccessibilityContents(axContents);\n\n\thideAllWithSelector_exceptElementsWithSelector_('.axhidden, .controls', '#controls-page-1');\n\n\t\n}",identifier:"1062"},{name:"hammeringNail",source:"function(hypeDocument, element, event) {\tdocument.title = \"When Hammering a Nail\";\n\t\n\tvar axContents = '';\n\taxContents += '<p role=\"text\" style=\"top: 66px;\">When you\u2019re hammering a nail, you can\u2019t just hit it a certain number of times and expect it to go all the way in.</p>';\n\taxContents += '<p role=\"text\" style=\"top: 200px;\">Instead, you continue hitting the nail while the nail is still sticking out.</p>';\n\taxContents += '<p role=\"img\" aria-label=\"Hammer hitting nail halfway into board.\" style=\"top: 390px; height: 275px;\"\"></p>';\n\t\n\treplaceAccessibilityContents(axContents);\n\n\thideAllWithSelector_exceptElementsWithSelector_('.axhidden, .controls', '#controls-page-2');\n\n\t\n}",identifier:"1063"},{name:"conditionTrue",source:"function(hypeDocument, element, event) {\tdocument.title = \"When Condition is True\";\n\t\n\tvar axContents = '';\n\taxContents += '<p role=\"text\" style=\"top: 82px;\">You can use a while loop to repeat a command, or a set of commands, while a condition is true. For example, while nailIsStickingOut.</p>';\n\taxContents += '<p role=\"text\" style=\"top: 294px;\">The condition <code>nailIsStickingOut</code> is true, so hammerNail left paren right paren runs.</p>';\n\taxContents += '<code style=\"top:249px; left:-27px;\">while nailIsStickingOut(){</code>';\n\taxContents += '<code style=\"top:290px;  left:-64px;\">hammerNail()</code>';\n\taxContents += '<code style=\"top:320px; left:-230px;\">}</code>';\n\t\n\treplaceAccessibilityContents(axContents);\n\n\thideAllWithSelector_exceptElementsWithSelector_('.axhidden, .controls', '#controls-page-3');\n\t\n}",identifier:"1064"},{name:"conditionFalse",source:"function(hypeDocument, element, event) {\tdocument.title = \"When Condition is False\";\n\t\n\tvar axContents = '';\n\taxContents += '<p role=\"text\" style=\"top: 290px;\">When <code>nailIsStickingOut</code> is false,<code>hammerNail()</code> stops running.</p>';\n\taxContents += '<p role=\"img\" aria-label=\"Hammer hitting nail all the way into board.\" style=\"top: 390px; height: 275px;\"\"></p>';\n\n\t\n\treplaceAccessibilityContents(axContents);\n\n\thideAllWithSelector_exceptElementsWithSelector_('.axhidden, .controls', '#controls-page-4');\n\n\n\t\n}",identifier:"1065"}];d={};g={};for(a=0;a<b.length;a++)try{g[b[a].identifier]=b[a].name,d[b[a].name]=eval("(function(){return "+b[a].source+"})();")}catch(m){window.console&&window.console.log(m),d[b[a].name]=
function(){}}a=new HYPE_584(c,e,{"-2":{n:"blank.gif"},"18":{n:"axstyles.css"},"10":{p:1,n:"../../../en.lproj/whileLoops/whileLoops.hyperesources/nail.svg",g:"928",t:"image/svg+xml"},"19":{n:"axworkarounds.js"},"11":{p:1,n:"../../../en.lproj/whileLoops/whileLoops.hyperesources/Cutscene-next-red_2x.png",g:"1013",t:"@2x"},"0":{p:1,n:"../../../en.lproj/whileLoops/whileLoops.hyperesources/basso_rightArm.svg",g:"15",t:"image/svg+xml"},"12":{p:1,n:"../../../en.lproj/whileLoops/whileLoops.hyperesources/Cutscene-previous_2x.png",g:"1017",t:"@2x"},"1":{p:1,n:"../../../en.lproj/whileLoops/whileLoops.hyperesources/basso_mouth.svg",g:"19",t:"image/svg+xml"},"2":{p:1,n:"../../../en.lproj/whileLoops/whileLoops.hyperesources/basso_leftArm.svg",g:"23",t:"image/svg+xml"},"13":{p:1,n:"../../../en.lproj/whileLoops/whileLoops.hyperesources/Cutscene-previous-red_2x.png",g:"1026",t:"@2x"},"3":{p:1,n:"../../../en.lproj/whileLoops/whileLoops.hyperesources/basso_head.svg",g:"25",t:"image/svg+xml"},"14":{p:1,n:"../../../en.lproj/whileLoops/whileLoops.hyperesources/Cutscene-previous-red_2x-1.png",g:"1058",o:true,t:"@1x"},"4":{p:1,n:"../../../en.lproj/whileLoops/whileLoops.hyperesources/basso_eye.svg",g:"27",t:"image/svg+xml"},"5":{p:1,n:"../../../en.lproj/whileLoops/whileLoops.hyperesources/basso_rightLeg.svg",g:"55",t:"image/svg+xml"},"15":{p:1,n:"../../../en.lproj/whileLoops/whileLoops.hyperesources/Cutscene-previous-red_2x-1_2x.png",g:"1058",o:true,t:"@2x"},"6":{p:1,n:"../../../en.lproj/whileLoops/whileLoops.hyperesources/basso_leftLeg.svg",g:"21",t:"image/svg+xml"},"16":{p:1,n:"../../../en.lproj/whileLoops/whileLoops.hyperesources/hammerAlt.svg",g:"930",t:"image/svg+xml"},"7":{n:"../../../en.lproj/whileLoops/whileLoops.hyperesources/basso_neck.png",p:1},"-1":{n:"../../../en.lproj/whileLoops/whileLoops.hyperesources/PIE.htc"},"8":{p:1,n:"../../../en.lproj/whileLoops/whileLoops.hyperesources/basso_neck.svg",g:"17",t:"image/svg+xml"},"17":{p:1,n:"../../../en.lproj/whileLoops/whileLoops.hyperesources/boardAlt.svg",g:"932",t:"image/svg+xml"},"9":{p:1,n:"../../../en.lproj/whileLoops/whileLoops.hyperesources/byte_base.svg",g:"29",t:"image/svg+xml"}},h,["","","","","","","",""],d,[{n:"whileLoops",o:"1",X:[0]}],[{o:"81",p:"600px",a:100,Y:1024,Z:768,b:100,cA:false,c:"#97C4FF",L:[],bY:1,d:1024,U:{},T:{kTimelineDefaultIdentifier:{i:"kTimelineDefaultIdentifier",n:"Timeline principale",z:17.15,b:[],a:[{f:"c",y:0,z:0.15,i:"e",e:1,s:0,o:"1103"},{f:"c",y:0,z:0.15,i:"b",e:251,s:186,o:"1100"},{f:"c",y:0,z:0.15,i:"e",e:1,s:0,o:"1102"},{f:"c",y:0,z:0.15,i:"b",e:251,s:186,o:"1099"},{f:"c",y:0,z:0.15,i:"e",e:1,s:0,o:"1099"},{f:"c",y:0,z:0.15,i:"e",e:1,s:0,o:"1100"},{f:"c",p:2,y:0.01,z:2.2,i:"ActionHandler",e:{a:[{b:"kTimelineDefaultIdentifier",symbolOid:"70",p:7},{p:4,h:"1062"}]},s:{a:[{p:4,h:"1061"}]},o:"kTimelineDefaultIdentifier"},{f:"c",y:0.15,z:0.07,i:"cR",e:0.17000000000000001,s:0.0038175491583561272,o:"1101"},{f:"c",y:0.15,z:1,i:"b",e:251,s:251,o:"1099"},{f:"c",y:0.15,z:1,i:"b",e:251,s:251,o:"1100"},{y:0.15,i:"e",s:1,z:0,o:"1102",f:"c"},{f:"c",y:0.15,z:0.03,i:"e",e:1,s:0,o:"1101"},{f:"c",y:0.15,z:1,i:"e",e:1,s:1,o:"1099"},{y:0.15,i:"e",s:1,z:0,o:"1103",f:"c"},{y:0.15,i:"e",s:1,z:0,o:"1100",f:"c"},{y:0.18,i:"e",s:1,z:0,o:"1101",f:"c"},{f:"c",y:0.22,z:0.03,i:"cR",e:0.14999999999999999,s:0.17000000000000001,o:"1101"},{y:0.25,i:"cR",s:0.14999999999999999,z:0,o:"1101",f:"c"},{f:"c",y:0.26,z:0.19,i:"a",e:137,s:136,o:"1101"},{f:"c",y:0.26,z:0.15,i:"f",e:30,s:0,o:"1101"},{f:"c",y:0.26,z:0.19,i:"b",e:-70,s:-91,o:"1101"},{f:"c",y:1.11,z:0.04,i:"f",e:-110,s:30,o:"1101"},{y:1.15,i:"d",s:1,z:0,o:"1099",f:"c"},{y:1.15,i:"c",s:180,z:0,o:"1099",f:"c"},{f:"c",y:1.15,z:0.09,i:"a",e:298,s:271,o:"1100"},{f:"c",y:1.15,z:0.09,i:"f",e:190,s:0,o:"1099"},{f:"c",y:1.15,z:0.11,i:"a",e:64,s:91,o:"1099"},{f:"c",y:1.15,z:0.09,i:"f",e:-190,s:0,o:"1100"},{f:"c",y:1.15,z:0.15,i:"a",e:137,s:137,o:"1101"},{f:"c",y:1.15,z:0.03,i:"f",e:0,s:-110,o:"1101"},{f:"c",y:1.15,z:0.15,i:"b",e:-86,s:-70,o:"1101"},{f:"c",y:1.15,z:0.09,i:"b",e:190,s:251,o:"1100"},{f:"c",y:1.15,z:0.11,i:"b",e:191,s:251,o:"1099"},{y:1.15,i:"e",s:1,z:0,o:"1099",f:"c"},{y:1.18,i:"f",s:0,z:0,o:"1101",f:"c"},{y:1.24,i:"a",s:298,z:0,o:"1100",f:"c"},{f:"c",y:1.24,z:0.02,i:"f",e:-180,s:-190,o:"1100"},{f:"c",y:1.24,z:0.02,i:"f",e:180,s:190,o:"1099"},{y:1.24,i:"b",s:190,z:0,o:"1100",f:"c"},{y:1.26,i:"a",s:64,z:0,o:"1099",f:"c"},{y:1.26,i:"f",s:-180,z:0,o:"1100",f:"c"},{y:1.26,i:"f",s:180,z:0,o:"1099",f:"c"},{y:1.26,i:"b",s:191,z:0,o:"1099",f:"c"},{y:2,i:"a",s:137,z:0,o:"1101",f:"c"},{y:2,i:"b",s:-86,z:0,o:"1101",f:"c"},{f:"e",y:2.17,z:0.04,i:"b",e:680,s:773,o:"1070"},{f:"c",p:2,y:2.21,z:4.17,i:"ActionHandler",e:{a:[{b:"kTimelineDefaultIdentifier",symbolOid:"70",p:7},{p:4,h:"1063"}]},s:{a:[{b:"kTimelineDefaultIdentifier",symbolOid:"70",p:7},{p:4,h:"1062"}]},o:"kTimelineDefaultIdentifier"},{f:"c",y:2.21,z:0.09,i:"e",e:0,s:1,o:"1098"},{f:"c",y:2.21,z:0,i:"b",e:680,s:680,o:"1070"},{f:"c",y:2.21,z:0.04,i:"b",e:773,s:680,o:"1070"},{y:2.25,i:"b",s:773,z:0,o:"1070",f:"e"},{f:"c",y:3,z:0.03,i:"e",e:1,s:0,o:"1084"},{y:3,i:"e",s:0,z:0,o:"1098",f:"c"},{f:"c",y:3,z:0.09,i:"b",e:265,s:665,o:"1084"},{f:"c",y:3,z:0.18,i:"b",e:35,s:-410,o:"1097"},{y:3.03,i:"e",s:1,z:0,o:"1084",f:"c"},{f:"c",y:3.09,z:0.06,i:"b",e:278,s:265,o:"1084"},{y:3.15,i:"b",s:278,z:0,o:"1084",f:"c"},{f:"c",y:3.18,z:0.12,i:"b",e:18,s:35,o:"1097"},{y:4,i:"b",s:18,z:0,o:"1097",f:"c"},{f:"c",y:5,z:0.15,i:"f",e:350,s:296,o:"1087"},{f:"c",y:5.15,z:0.05,i:"f",e:285,s:350,o:"1087"},{f:"c",y:5.2,z:0.04,i:"f",e:290,s:285,o:"1087"},{f:"c",y:5.2,z:0.01,i:"b",e:346,s:325,o:"1086"},{f:"c",y:5.2,z:0.02,i:"b",e:379,s:374,o:"1085"},{f:"c",y:5.21,z:0.23,i:"b",e:346,s:346,o:"1086"},{f:"c",y:5.22,z:0.02,i:"b",e:374,s:379,o:"1085"},{f:"c",y:5.24,z:0.06,i:"f",e:296,s:290,o:"1087"},{f:"c",y:5.24,z:0.2,i:"b",e:374,s:374,o:"1085"},{f:"c",y:6,z:0.09,i:"f",e:350,s:296,o:"1087"},{f:"c",y:6.06,z:0.15,i:"d",e:140,s:-15,o:"1096"},{f:"c",y:6.06,z:0.15,i:"b",e:142,s:312,o:"1096"},{f:"c",y:6.09,z:0.05,i:"f",e:280,s:350,o:"1087"},{f:"c",y:6.14,z:0.04,i:"f",e:290,s:280,o:"1087"},{f:"c",y:6.14,z:0.01,i:"b",e:356,s:346,o:"1086"},{f:"c",y:6.14,z:0.02,i:"b",e:379,s:374,o:"1085"},{f:"c",y:6.15,z:7.15,i:"b",e:356,s:356,o:"1086"},{f:"c",y:6.16,z:0.02,i:"b",e:374,s:379,o:"1085"},{f:"c",y:6.18,z:0.06,i:"f",e:296,s:290,o:"1087"},{f:"c",y:6.18,z:8.04,i:"b",e:374,s:374,o:"1085"},{y:6.21,i:"d",s:140,z:0,o:"1096",f:"c"},{f:"c",y:6.21,z:0.08,i:"b",e:157,s:142,o:"1096"},{f:"c",y:6.24,z:7.1,i:"f",e:296,s:296,o:"1087"},{y:6.29,i:"b",s:157,z:0,o:"1096",f:"c"},{f:"e",y:7.04,z:0.04,i:"b",e:680,s:773,o:"1089"},{f:"c",p:2,y:7.08,z:6.22,i:"ActionHandler",e:{a:[{b:"kTimelineDefaultIdentifier",symbolOid:"70",p:7},{p:4,h:"1064"}]},s:{a:[{b:"kTimelineDefaultIdentifier",symbolOid:"70",p:7},{p:4,h:"1063"}]},o:"kTimelineDefaultIdentifier"},{f:"c",y:7.08,z:0.09,i:"e",e:0,s:1,o:"1095"},{f:"c",y:7.08,z:0,i:"b",e:680,s:680,o:"1089"},{f:"c",y:7.08,z:0.04,i:"b",e:773,s:680,o:"1089"},{y:7.12,i:"b",s:773,z:0,o:"1089",f:"e"},{y:7.17,i:"e",s:0,z:0,o:"1095",f:"c"},{f:"c",y:7.23,z:0.18,i:"b",e:96,s:-349,o:"1115"},{f:"c",y:8.11,z:0.12,i:"b",e:79,s:96,o:"1115"},{y:8.23,i:"b",s:79,z:0,o:"1115",f:"c"},{f:"c",y:9.23,z:0.09,i:"e",e:1,s:0,o:"1113"},{f:"c",y:9.23,z:0.09,i:"e",e:1,s:0,o:"1112"},{f:"c",y:9.23,z:0.09,i:"e",e:1,s:0,o:"1114"},{y:10.02,i:"e",s:1,z:0,o:"1113",f:"c"},{y:10.02,i:"e",s:1,z:0,o:"1112",f:"c"},{y:10.02,i:"e",s:1,z:0,o:"1114",f:"c"},{f:"c",y:10.23,z:0.09,i:"e",e:1,s:0,o:"1120"},{f:"c",y:10.23,z:0.09,i:"e",e:0.40000000000000002,s:-0.59999999999999998,o:"1117"},{f:"c",y:11.02,z:4.21,i:"e",e:1,s:1,o:"1120"},{y:11.02,i:"e",s:0.40000000000000002,z:0,o:"1117",f:"c"},{f:"c",y:11.23,z:0.06,i:"b",e:3,s:35,o:"1119"},{f:"c",y:11.29,z:0.09,i:"e",e:0.40000000000000002,s:0,o:"1083"},{f:"c",y:11.29,z:0.06,i:"b",e:5,s:3,o:"1119"},{y:12.05,i:"b",s:5,z:0,o:"1119",f:"c"},{y:12.08,i:"e",s:0.40000000000000002,z:0,o:"1083",f:"c"},{f:"e",y:13.26,z:0.04,i:"b",e:680,s:773,o:"1104"},{f:"c",p:2,y:14,z:3.15,i:"ActionHandler",e:{a:[{b:"kTimelineDefaultIdentifier",symbolOid:"70",p:7},{p:4,h:"1065"}]},s:{a:[{b:"kTimelineDefaultIdentifier",symbolOid:"70",p:7},{p:4,h:"1064"}]},o:"kTimelineDefaultIdentifier"},{f:"c",y:14,z:0,i:"b",e:680,s:680,o:"1104"},{f:"c",y:14,z:0.04,i:"b",e:773,s:680,o:"1104"},{f:"c",y:14,z:0.02,i:"b",e:322,s:356,o:"1086"},{f:"c",y:14.02,z:0.02,i:"b",e:326,s:322,o:"1086"},{f:"c",y:14.04,z:0.15,i:"f",e:350,s:296,o:"1087"},{y:14.04,i:"b",s:773,z:0,o:"1104",f:"e"},{f:"c",y:14.04,z:0.2,i:"b",e:325,s:326,o:"1086"},{f:"c",y:14.19,z:0.05,i:"f",e:285,s:350,o:"1087"},{f:"c",y:14.22,z:0.02,i:"b",e:379,s:374,o:"1085"},{f:"c",y:14.24,z:0.04,i:"f",e:290,s:285,o:"1087"},{f:"c",y:14.24,z:0.01,i:"b",e:346,s:325,o:"1086"},{f:"c",y:14.24,z:0.02,i:"b",e:374,s:379,o:"1085"},{f:"c",y:14.25,z:0.26,i:"b",e:346,s:346,o:"1086"},{f:"c",y:14.26,z:0.25,i:"b",e:374,s:374,o:"1085"},{f:"c",y:14.28,z:0.06,i:"f",e:296,s:290,o:"1087"},{f:"c",y:15.04,z:0.05,i:"f",e:296,s:296,o:"1087"},{f:"c",y:15.09,z:0.09,i:"f",e:350,s:296,o:"1087"},{f:"c",y:15.18,z:0.03,i:"f",e:280,s:350,o:"1087"},{f:"c",y:15.21,z:0.02,i:"f",e:290,s:280,o:"1087"},{f:"c",y:15.21,z:0.01,i:"b",e:356,s:346,o:"1086"},{f:"c",y:15.21,z:0.02,i:"b",e:379,s:374,o:"1085"},{f:"c",y:15.22,z:0.22,i:"b",e:356,s:356,o:"1086"},{f:"c",y:15.23,z:0,i:"f",e:296,s:290,o:"1087"},{f:"c",y:15.23,z:0.09,i:"f",e:296,s:296,o:"1087"},{f:"c",y:15.23,z:0.1,i:"e",e:1,s:0,o:"1088"},{f:"c",y:15.23,z:0.09,i:"e",e:0,s:1,o:"1120"},{f:"c",y:15.23,z:0.02,i:"b",e:374,s:379,o:"1085"},{f:"c",y:15.25,z:0.19,i:"b",e:374,s:374,o:"1085"},{f:"c",y:16.02,z:0.09,i:"f",e:350,s:296,o:"1087"},{y:16.02,i:"e",s:0,z:0,o:"1120",f:"c"},{y:16.03,i:"e",s:1,z:0,o:"1088",f:"c"},{f:"c",y:16.11,z:0.03,i:"f",e:277,s:350,o:"1087"},{f:"c",y:16.14,z:0.02,i:"f",e:290,s:277,o:"1087"},{f:"c",y:16.14,z:0.01,i:"b",e:372,s:356,o:"1086"},{f:"c",y:16.14,z:0.02,i:"b",e:379,s:374,o:"1085"},{f:"c",y:16.15,z:0.22,i:"b",e:372,s:372,o:"1086"},{f:"c",y:16.16,z:0.04,i:"f",e:296,s:290,o:"1087"},{f:"c",y:16.16,z:0.02,i:"b",e:374,s:379,o:"1085"},{f:"c",y:16.18,z:0.19,i:"b",e:374,s:374,o:"1085"},{f:"c",y:16.2,z:0.05,i:"f",e:296,s:296,o:"1087"},{f:"c",y:16.25,z:0.09,i:"f",e:350,s:296,o:"1087"},{f:"c",y:17.04,z:0.03,i:"f",e:272,s:350,o:"1087"},{f:"c",y:17.07,z:0.02,i:"f",e:290,s:272,o:"1087"},{f:"c",y:17.07,z:0.01,i:"b",e:390,s:372,o:"1086"},{f:"c",y:17.07,z:0.02,i:"b",e:379,s:374,o:"1085"},{y:17.08,i:"b",s:390,z:0,o:"1086",f:"c"},{f:"c",y:17.09,z:0.04,i:"f",e:296,s:290,o:"1087"},{f:"c",y:17.09,z:0.02,i:"b",e:374,s:379,o:"1085"},{f:"e",y:17.11,z:0.04,i:"b",e:680,s:773,o:"1077"},{y:17.11,i:"b",s:374,z:0,o:"1085",f:"c"},{y:17.13,i:"f",s:296,z:0,o:"1087",f:"c"},{f:"c",p:2,y:17.15,z:0,i:"ActionHandler",s:{a:[{b:"kTimelineDefaultIdentifier",symbolOid:"70",p:7},{p:4,h:"1065"}]},o:"kTimelineDefaultIdentifier"},{y:17.15,i:"b",s:680,z:0,o:"1077",f:"c"}],f:30}},bZ:180,O:["1076","1110","1095","1097","1101","1115","1098","1096","1103","1111","1083","1112","1084","1087","1113","1116","1117","1119","1114","1088","1120","1118","1099","1100","1102","1086","1085","1071","1070","1093","1089","1108","1104","1082","1077","1072","1094","1105","1074","1091","1107","1078","1073","1090","1106","1080","1079","1081","1075","1092","1109"],n:"iPad Landscape","_":0,v:{"1106":{G:"#000000",aU:8,c:67,d:21,aV:8,r:"inline",e:0.33000000000000002,s:"SFUIText-Regular",t:17,Z:"break-word",w:"3/4",bF:"1104",j:"absolute",x:"visible",k:"div",y:"preserve",z:1,aS:8,aT:8,a:101,F:"center",b:29},"1091":{c:44,d:44,I:"None",e:1,J:"None",K:"None",g:"#FFFFFF",L:"None",M:0,N:0,aI:"50%",A:"#D8DDE4",x:"visible",O:0,j:"absolute",aJ:"50%",k:"div",C:"#D8DDE4",z:5,B:"#D8DDE4",D:"#D8DDE4",aK:"50%",bF:"1089",P:0,a:22,aL:"50%",b:22},"1114":{G:"#29413D",aU:8,aV:8,r:"inline",e:0,s:"SFMono-Bold",t:28,Z:"break-word",w:"}",bF:"1111",j:"absolute",x:"visible",yy:"nowrap",k:"div",y:"preserve",z:3,aS:8,aT:8,a:4,b:71},"1110":{x:"visible",a:160,b:21,j:"absolute",r:"inline",c:716,k:"div",z:5,d:201,cP:"axhidden",e:1,bD:"none"},"1118":{c:415,d:80,I:"None",r:"inline",e:1,J:"None",K:"None",g:"#FFFFFF",L:"None",M:0,w:"",aI:10,A:"#D8DDE4",N:0,O:0,x:"visible",aJ:10,j:"absolute",C:"#D8DDE4",z:1,k:"div",D:"#D8DDE4",aK:10,B:"#D8DDE4",bF:"1117",P:0,a:-9,aL:10,b:23},"1076":{c:1024,cP:"axhidden",d:768,I:"None",J:"None",bD:"none",K:"None",L:"None",M:0,w:"",N:0,A:"#D8DDE4",x:"visible",j:"absolute",O:0,k:"div",B:"#D8DDE4",C:"#D8DDE4",z:0,l:0,D:"#D8DDE4",m:"#B4D9FF",P:0,n:"rgba(180, 217, 255, 0.000)",a:0,b:0},"1088":{G:"#29413D",aU:8,c:400,cP:"axhidden",d:66,aV:8,r:"inline",e:0,s:"SanFranciscoDisplay-Regular",bD:"none",t:22,Z:"break-word",w:"\u91d8\u304c\u51fa\u3066\u3044\u306a\u3051\u308c\u3070\u3001\n<font face=\"SFMono-Light\">hammerNail()</font>\u304c\u6b62\u307e\u308a\u307e\u3059\u3002",j:"absolute",x:"visible",k:"div",y:"preserve",z:18,aS:8,aT:8,a:562,b:322},"1072":{h:"1013",p:"no-repeat",x:"visible",a:196,dB:"button",b:0,q:"100% 100%",j:"absolute",aA:{a:[{i:3,b:"kTimelineDefaultIdentifier",p:9,symbolOid:"70"},{b:"kTimelineDefaultIdentifier",p:8,z:false,symbolOid:"70",J:false}]},z:3,k:"div",d:88,bF:"1070",cQ:0.5,aP:"pointer",aG:"next",c:88,r:"inline",cR:0.5},"1084":{x:"visible",a:-11,b:665,j:"absolute",r:"inline",c:604.09000000000003,k:"div",z:19,d:578.13999999999999,cP:"axhidden",e:0,bD:"none"},"1096":{G:"#29413D",aU:8,c:787,aV:8,d:-15,r:"inline",s:"SanFranciscoDisplay-light",t:34,Z:"break-word",w:"<div>\u305d\u3046\u3067\u306f\u306a\u304f\u3001\u91d8\u304c\u307e\u3060\u98db\u3073\u51fa\u3066\u3044\u308b\u9593\uff08<font face=\"SanFranciscoDisplay-Bold\">while</font>\uff09\u3060\u3051\u91d8\u3092\u6253\u3061\u7d9a\u3051\u308b\u3053\u3068\u306b\u306a\u308a\u307e\u3059\u3002</div><div><br></div>",bF:"1095",j:"absolute",x:"hidden",k:"div",y:"preserve",z:2,aS:8,aT:8,a:-21,F:"center",b:312},"1103":{G:"#29413D",aU:8,c:339,d:85,aV:8,r:"inline",e:0,s:"'Helvetica Neue',Arial,Helvetica,Sans-Serif",t:16,Z:"break-word",w:"<font style=\"font-size: 64px;\" face=\"SanFranciscoDisplay-Regular\">while\u30eb\u30fc\u30d7</font><br>",bF:"1098",j:"absolute",x:"visible",k:"div",y:"preserve",z:1,aS:8,aT:8,a:94,F:"center",b:48},"1080":{c:148,d:44,I:"None",J:"None",K:"None",g:"#FFFFFF",L:"None",M:0,N:0,aI:100,A:"#D8DDE4",x:"visible",j:"absolute",O:0,aJ:100,k:"div",C:"#D8DDE4",z:1,B:"#D8DDE4",D:"#D8DDE4",aK:100,bF:"1079",P:0,a:0,aL:100,b:0},"1092":{c:44,d:44,I:"None",J:"None",K:"None",g:"#FFFFFF",L:"None",M:0,N:0,aI:"50%",A:"#D8DDE4",x:"visible",j:"absolute",O:0,aJ:"50%",k:"div",C:"#D8DDE4",z:2,B:"#D8DDE4",D:"#D8DDE4",aK:"50%",bF:"1089",P:0,a:218,aL:"50%",b:22},"1107":{c:44,d:44,I:"None",e:1,J:"None",K:"None",g:"#FFFFFF",L:"None",M:0,N:0,aI:"50%",A:"#D8DDE4",x:"visible",O:0,j:"absolute",aJ:"50%",k:"div",C:"#D8DDE4",z:5,B:"#D8DDE4",D:"#D8DDE4",aK:"50%",bF:"1104",P:0,a:22,aL:"50%",b:22},"1111":{x:"visible",k:"div",c:513,r:"inline",d:51,z:7,e:1,a:101,j:"absolute",bF:"1110",b:217},"1115":{G:"#29413D",aU:8,c:700,bS:36,d:148,aV:8,r:"inline",e:1,s:"SanFranciscoDisplay-light",t:34,Z:"break-word",w:"<font face=\"SanFranciscoDisplay-Bold\">while\u30eb\u30fc\u30d7</font>\u3092\u4f7f\u3048\u3070\u3001\u6761\u4ef6\u304ctrue\uff08\u771f\uff09\u306e\u9593\u3060\u3051\u30b3\u30de\u30f3\u30c9\u3092\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3067\u304d\u307e\u3059\u3002<br>",bF:"1110",j:"absolute",x:"visible",k:"div",y:"preserve",z:10,aS:8,aT:8,a:-6,F:"center",b:-349},"1119":{c:42,d:42,I:"None",r:"inline",e:1,J:"None",f:45,K:"None",g:"#FFFFFF",L:"None",M:0,N:0,bF:"1117",A:"#D8DDE4",x:"visible",j:"absolute",B:"#D8DDE4",k:"div",O:0,C:"#D8DDE4",z:2,P:0,D:"#D8DDE4",a:40,b:35},"1077":{x:"visible",i:"controls-page-4",a:370,b:773,j:"absolute",r:"inline",c:284,k:"div",z:21,d:88,cP:"controls",bD:"none"},"1089":{x:"visible",i:"controls-page-2",a:370,b:773,j:"absolute",r:"inline",c:284,k:"div",z:24,d:88,cP:"controls",bD:"none"},"1073":{G:"#000000",aU:8,c:67,d:21,aV:8,r:"inline",e:0.33000000000000002,s:"SFUIText-Regular",t:17,Z:"break-word",w:"1/4",bF:"1070",j:"absolute",x:"visible",k:"div",y:"preserve",z:1,aS:8,aT:8,a:101,F:"center",b:29},"1085":{h:"932",p:"no-repeat",x:"visible",a:0,q:"100% 100%",b:374,j:"absolute",bF:"1084",z:3,k:"div",c:413.60000000000002,d:193.47999999999999,r:"inline",cQ:0.80000000000000004,cR:0.80000000000000004},"1097":{G:"#29413D",aU:8,c:787,bS:36,d:105,aV:8,r:"inline",e:1,s:"SanFranciscoDisplay-light",cQ:1,t:34,cR:1,Z:"break-word",w:"\u91d8\u3092\u6253\u3064\u3068\u304d\u306f\u3001\u6c7a\u307e\u3063\u305f\u56de\u6570\u6253\u3066\u3070\u91d8\u304c\u5b8c\u5168\u306b\u5165\u308b\u308f\u3051\u3067\u306f\u3042\u308a\u307e\u305b\u3093\u3002<br>",bF:"1095",j:"absolute",x:"visible",k:"div",y:"preserve",z:3,aS:8,aT:8,a:-21,F:"center",b:-410},"1104":{x:"visible",i:"controls-page-3",a:370,b:773,j:"absolute",r:"inline",c:284,k:"div",z:23,d:88,cP:"controls",bD:"none"},"1081":{G:"#FE4B26",aU:8,c:108,d:21,aV:8,r:"inline",s:"SFUIText-Semibold",aG:"start coding button",t:17,Z:"break-word",aP:"pointer",w:"\u6b21\u3078",bF:"1079",aA:{a:[{j:"@next",p:5,k:false}]},x:"visible",j:"absolute",k:"div",y:"preserve",dB:"button",z:2,aS:8,aT:8,a:12,F:"center",b:3},"1093":{h:"1026",p:"no-repeat",x:"visible",a:0,dB:"button",b:0,q:"100% 100%",j:"absolute",aA:{a:[{i:0,b:"kTimelineDefaultIdentifier",p:9,symbolOid:"70"},{b:"kTimelineDefaultIdentifier",p:8,z:false,symbolOid:"70",J:false}]},z:6,k:"div",d:88,bF:"1089",cQ:0.5,aP:"pointer",aG:"previous",c:88,r:"inline",cR:0.5},"1100":{G:"#29413D",aU:0,c:180,d:1,I:"None",aV:0,e:0,J:"None",f:0,K:"None",g:"#29413D",L:"None",M:0,w:"",N:0,A:"#29413D",O:0,x:"visible",j:"absolute",k:"div",B:"#29413D",C:"#29413D",z:3,bF:"1098",D:"#29413D",aS:0,P:0,aT:0,a:271,b:186},"1108":{h:"1026",p:"no-repeat",x:"visible",a:0,dB:"button",b:0,q:"100% 100%",j:"absolute",aA:{a:[{i:3,b:"kTimelineDefaultIdentifier",p:9,symbolOid:"70"},{b:"kTimelineDefaultIdentifier",p:8,z:false,symbolOid:"70",J:false}]},z:6,k:"div",d:88,bF:"1104",cQ:0.5,aP:"pointer",aG:"previous",c:88,r:"inline",cR:0.5},"1112":{G:"#29413D",aU:8,c:468,bS:36,d:35,aV:8,r:"inline",e:0,s:"SFMono-Bold",t:28,Z:"break-word",w:"while nailIsStickingOut {<br>",bF:"1111",j:"absolute",x:"visible",k:"div",y:"preserve",z:1,aS:8,aT:8,a:6,F:"left",b:0},"1116":{x:"visible",k:"div",c:371,r:"inline",d:122,z:1,e:1,a:419,j:"absolute",bF:"1110",b:270},"1120":{G:"#29413D",aU:8,c:400,aV:8,d:64,r:"inline",e:0,s:"SanFranciscoDisplay-Regular",t:22,Z:"break-word",w:"<font face=\"SFMono-Light\">nailIsStickingOut</font>\u304ctrue\uff08\u771f\uff09\u306e\u9593\u3001<font face=\"SFMono-Light\">hammerNail()</font>\u3067\u91d8\u3092\u6253\u3061\u307e\u3059\u3002",bF:"1116",j:"absolute",x:"visible",k:"div",y:"preserve",z:5,aS:8,aT:8,a:-17,b:31},"1078":{c:44,d:44,I:"None",J:"None",K:"None",g:"#FFFFFF",L:"None",M:0,N:0,aI:"50%",A:"#D8DDE4",x:"visible",j:"absolute",O:0,aJ:"50%",k:"div",C:"#D8DDE4",z:4,B:"#D8DDE4",D:"#D8DDE4",aK:"50%",bF:"1077",P:0,a:22,aL:"50%",b:22},"1074":{c:44,d:44,I:"None",e:0.33000000000000002,J:"None",K:"None",g:"#FFFFFF",L:"None",M:0,N:0,aI:"50%",A:"#D8DDE4",x:"visible",O:0,j:"absolute",aJ:"50%",k:"div",C:"#D8DDE4",z:5,B:"#D8DDE4",D:"#D8DDE4",aK:"50%",bF:"1070",P:0,a:22,aL:"50%",b:22},"1086":{h:"928",p:"no-repeat",x:"visible",a:214,q:"100% 100%",b:325,j:"absolute",bF:"1084",z:1,k:"div",c:44.710000000000001,d:124.97,r:"inline",cQ:0.80000000000000004,cR:0.80000000000000004},"1098":{bD:"none",x:"visible",tY:0.5,a:246,b:169,j:"absolute",r:"inline",z:20,k:"div",cP:"axhidden",d:370,c:544,e:1,tX:0.5},"1070":{x:"visible",i:"controls-page-1",a:370,b:773,j:"absolute",r:"inline",c:284,k:"div",z:25,d:88,cP:"controls",bD:"none"},"1082":{h:"1058",p:"no-repeat",x:"visible",a:0,dB:"button",b:0,q:"100% 100%",j:"absolute",aA:{a:[{i:7.5333333015441895,b:"kTimelineDefaultIdentifier",p:9,symbolOid:"70"},{b:"kTimelineDefaultIdentifier",p:8,z:false,symbolOid:"70",J:false}]},z:5,k:"div",d:88,bF:"1077",cQ:0.5,aP:"pointer",aG:"previous",c:88,r:"inline",cR:0.5},"1094":{h:"1013",p:"no-repeat",x:"visible",a:196,dB:"button",b:0,q:"100% 100%",j:"absolute",aA:{a:[{i:7.5333333015441895,b:"kTimelineDefaultIdentifier",p:9,symbolOid:"70"},{b:"kTimelineDefaultIdentifier",p:8,z:false,symbolOid:"70",J:false}]},z:3,k:"div",d:88,bF:"1089",cQ:0.5,aP:"pointer",aG:"next",c:88,r:"inline",cR:0.5},"1101":{h:"930",p:"no-repeat",x:"visible",a:136,q:"100% 100%",b:-91,j:"absolute",bF:"1098",z:4,k:"div",c:270,d:578.13999999999999,r:"inline",cQ:0.14999999999999999,e:0,f:0,cR:0.0038175491583561272},"1105":{h:"1013",p:"no-repeat",x:"visible",a:196,dB:"button",b:0,q:"100% 100%",j:"absolute",aA:{a:[{i:14.133333206176758,b:"kTimelineDefaultIdentifier",p:9,symbolOid:"70"},{b:"kTimelineDefaultIdentifier",p:8,z:false,symbolOid:"70",J:false}]},z:3,k:"div",d:88,bF:"1104",cQ:0.5,aP:"pointer",aG:"next",c:88,r:"inline",cR:0.5},"1090":{G:"#000000",aU:8,c:67,d:21,aV:8,r:"inline",e:0.33000000000000002,s:"SFUIText-Regular",t:17,Z:"break-word",w:"2/4",bF:"1089",j:"absolute",x:"visible",k:"div",y:"preserve",z:1,aS:8,aT:8,a:101,F:"center",b:29},"1109":{c:44,d:44,I:"None",J:"None",K:"None",g:"#FFFFFF",L:"None",M:0,N:0,aI:"50%",A:"#D8DDE4",x:"visible",j:"absolute",O:0,aJ:"50%",k:"div",C:"#D8DDE4",z:2,B:"#D8DDE4",D:"#D8DDE4",aK:"50%",bF:"1104",P:0,a:218,aL:"50%",b:22},"1113":{G:"#29413D",aU:8,aV:8,r:"inline",e:0,s:"SFMono-Light",t:28,Z:"break-word",w:"hammerNail()",bF:"1111",j:"absolute",x:"visible",yy:"nowrap",k:"div",y:"preserve",z:2,aS:8,aT:8,a:75,b:42},"1117":{x:"visible",k:"div",c:363,r:"inline",d:106,z:1,e:-0.59999999999999998,a:-14,j:"absolute",bF:"1116",b:6},"1079":{x:"visible",a:110,b:22,j:"absolute",bF:"1077",c:148,k:"div",z:3,d:44,r:"inline",aP:"pointer",aG:"Start coding button"},"1075":{c:44,d:44,I:"None",J:"None",K:"None",g:"#FFFFFF",L:"None",M:0,N:0,aI:"50%",A:"#D8DDE4",x:"visible",j:"absolute",O:0,aJ:"50%",k:"div",C:"#D8DDE4",z:2,B:"#D8DDE4",D:"#D8DDE4",aK:"50%",bF:"1070",P:0,a:218,aL:"50%",b:22},"1087":{h:"930",p:"no-repeat",x:"visible",a:334,q:"100% 100%",b:0,j:"absolute",bF:"1084",z:2,k:"div",c:270.08999999999997,d:578.13999999999999,r:"inline",cQ:0.80000000000000004,f:296,cR:0.80000000000000004},"1099":{G:"#29413D",aU:0,c:180,d:1,I:"None",aV:0,e:0,J:"None",f:0,K:"None",g:"#29413D",L:"None",M:0,w:"",N:0,A:"#29413D",O:0,x:"visible",j:"absolute",k:"div",B:"#29413D",C:"#29413D",z:2,bF:"1098",D:"#29413D",aS:0,P:0,aT:0,a:91,b:186},"1071":{h:"1017",p:"no-repeat",x:"visible",a:0,q:"100% 100%",b:0,j:"absolute",bF:"1070",z:6,k:"div",c:88,d:88,r:"inline",cQ:0.5,e:0.20000000000000001,aG:"previous",cR:0.5},"1083":{c:420,cP:"axhidden",d:40,I:"None",r:"inline",e:0,J:"None",bD:"none",K:"None",g:"#FFFFFF",L:"None",M:0,N:0,aI:10,A:"#D8DDE4",O:0,x:"visible",j:"absolute",aJ:10,k:"div",C:"#D8DDE4",z:3,B:"#D8DDE4",D:"#D8DDE4",aK:10,P:0,a:264,aL:10,b:244},"1095":{x:"visible",a:132,b:64,j:"absolute",r:"inline",c:744,k:"div",z:7,d:290,cP:"axhidden",e:1,bD:"none"},"1102":{G:"#29413D",aU:8,c:564,d:103,aV:8,r:"inline",e:0,s:"SanFranciscoDisplay-Light",t:34,Z:"break-word",w:"\u307e\u3060\u7d42\u308f\u308a\u307e\u305b\u3093\u304b?",bF:"1098",j:"absolute",x:"visible",k:"div",y:"preserve",z:0,aS:8,aT:8,a:-24,F:"center",b:300}}}],{},g,{},null,false,true,-1,true,true,false,true);f[c]=a.API;document.getElementById(e).setAttribute("HYP_dn",
c);a.z_o(this.body)})();})();

<%-- 
    Document   : TestSpeech
    Created on : Feb 6, 2023, 8:55:47 AM
    Author     : Phongsathon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <h1 id="hh1">Speech color changer</h1>


        <p class="hints"></p>
        <div>
            <p id="txt" class="output"><em>...diagnostic messages</em></p>
        </div>

    </body>
</html>-->
<script>

//
//    const SpeechRecognition = window.SpeechRecognition || webkitSpeechRecognition;
//    const SpeechGrammarList = window.SpeechGrammarList || webkitSpeechGrammarList;
//    const SpeechRecognitionEvent = window.SpeechRecognitionEvent || webkitSpeechRecognitionEvent;
//
//
//    const recognition = new SpeechRecognition();
//    const speechRecognitionList = new SpeechGrammarList();
//    const speechrecognitionlist = new SpeechGrammarList();
//
//    const diagnostic = document.querySelector('.output');
//    const bg = document.querySelector('html');
//    const hints = document.querySelector('.hints');
//    const hh = document.getElementById('hh1');
//    const txtt = document.getElementById('txt');
//
//    // setGrammar('#JSGF V1.0; grammar test; public <simple> =   this is a demo | of the voice inputs | in two different accents | i speak in indian accent | i speak in brazilian accent | we hope this thing becomes huge | here is to the open web | lets say a few other things | how deep is the atlantic ocean | go forward ten meters ;');
//
//    recognition.grammars = speechRecognitionList;
//
    1 firm Infrastruture = "-การจัดสรรนโยบายทางการเงิน

            - การจัดสรรนโยบายทางการบัญชี

            - การรักษากฏระเบียบในองร์กร

            - การจัดการนโยบายพันธมิตรชุมชน";
    
    
    
    2 = Human resources management = "-การฝึกเทรนนิ่งเส้นทางบิน
    -การฝึกเทรนนิ่งนักบินและความปลอดภัย
    -การฝึกเทรนนิ่งการโหลดกระเป๋า
    -การฝึกเทรนนิ่งพนักงานภาคพื้นดิน
    -การฝึกเทรนนิ่งการบริการ";
    
    
    3 Technology Development = " -การใช้ระบบการจองออนไลน์
    -การใช้ระบบวางแผนการบิน 
    -การใช้ระบบการตรวจสอบสัมภาระ
    -การใช้ระบบจัดการข้อมูลผู้โดยสาร
    -การใช้ระบบสารสนเทศวิเคราะห์วิจัยทางการตลาด
    
"    
    
    
    
    
    4 Procrement  = " 
    -การจัดหาผู้เชี่ยวชาญเพื่อเป็นที่ปรึกษาในการทำงาน
    -การจัดการเรื่องเส้นทางการบิน 
    -การจัดการเรื่องช่องที่ใช้ในการประชาสัมพันธ์ต่างๆ
    -การจัดการช่องทางการติดต่อหลักการขาย
    -การตกลงร่วมกันกับพันธมิตรทางการค้า
    -จัดการสถานที่ในการให้บริการ 
    
"    

5 inbpunt logistic = "
-กิจกกรมการวางแผนเส้นทางบินที่มีผู้ต้องการ
-ใช้ระบบแสดงการบริการลูกค้าผ่านทางออนไลน์
-การใช้การจัดการทางด้านเชื้อเพลิง
-การจัดการตารางการทำงานของนักบินและลูกเรือ
-การจัดการตารางการบินในแต่ละวัน
-การคัดเลือกสภาพของเครื่องบิน
"

6 Operation = "
-การดำเนินงานห้องขายตั๋ว
-การดำเนินการเปิดปิดเกต
-การดำเนินการบิน
-การดำเนินการบริการบนเครื่อง
-การดำเนินแจ้งการด้านรับสัมภาระ
-การดำเนินการจัดเก็บและแก้ไขข้อมูลของการบิน

"

7 outbound logistics = "
-การดำเนินการรับสัมภาระ
-การดำเนินการต่อเครื่อง
-การดำเนินการรับส่ง โรงแรมและที่พัก


"

8 Market and sales = "
-โปรโมชั่นต่างๆ
-การโฆษณาตามสื่อต่างๆ
-การมีระบบสมาชิก
-การออกตั๋วอิเล็กทรอนิก คูปองรางวัลต่างๆ
-การขายตั๋วกลุ่มของสายการบิน
-การดำเนินงานผ่านทาง เอเจนซี่ต่างๆ ทั้งออนไลน์และออฟไลน์ 



"

9 Service = "

-การติดตาม รับผิดชอบ สัมภาระศูนย์หาย 
-การประเมินความพึงพอใจในการใช้งาน และบริการ

"
    
    
    
//    var status = "0";
//
//
////    speechRecognitionList.addFromString(grammar, 1);
//
//
////    recognition.grammars = speechRecognitionList;
////    recognition.continuous = false;
////    recognition.lang = 'en-US';
////    recognition.interimResults = false;
////    recognition.maxAlternatives = 1;
////    recognition.lang = 'en-US'
//    recognition.lang = 'th-TH'
//    recognition.continuous = true;
//    recognition.interimResults = true;
////    recognition.maxAlternatives = 1;
//
//
//
//
//
//
////    hints.innerHTML = `Tap or click then say a color to change the background color of the app. Try ${colorHTML}.`;
//
//    document.body.onclick = () => {
//        recognition.start();
//        console.log('Ready to receive a color command.');
//    };
//
//
//
//
//    recognition.onresult = (event) => {
//
//        var theWord = "demo";
//        for (var i = event.resultIndex; i < event.results.length; ++i) {
//
////            console.log(event.results[i][0].confidence);
//            if (event.results[i].isFinal) {
//                console.log("aaa : " + event.results[i][0].transcript);
////                var color2 = (event.results[i][0].transcript);
////
////                console.log(color2);
////                console.log(color2.trim() === "demo");
////                console.log(status);
//// console.log(status=== "0");
////
////                if (color2.trim() === "demo" && status === "0")
////                {
////
////                    console.log("What sub?");
////                    status = "1";
////                }
////                  if (color2.trim() === "okay" && status === "1")
////                {
////
////                   alert("Thank you"); 
////                    status = "0";
////                }
////                
//
//
//            } else {
//                console.log("bbb : " + event.results[i][0].transcript);
//                var color2 = (event.results[i][0].transcript);
////                console.log(color2);
////                console.log(color2.indexOf("demo"));
////                console.log(status);
////                console.log(status === "0");
////
////                if (color2.indexOf("demo") && status === "0")
////                {
////
////                    console.log("What sub?");
////                    status = "1";
////                }
////                if (color2.indexOf("okay") && status === "1")
////                {
////
////                    alert("Thank you");
////                    status = "0";
////                }
////
////
////            }
//
//                controlGameBySpeech(color2);
//                txtt.innerHTML = color2;
//                hh.innerHTML = color2;
//            }
//
//
//
//
//
//
//
//
//
//        }
//
//
//        recognition.onspeechend = () => {
//            recognition.stop();
//        }
//
//
//        recognition.onnomatch = (event) => {
//            diagnostic.textContent = "I didn't recognize that color.";
//        }
//
//        recognition.onerror = (event) => {
//            diagnostic.textContent = `Error occurred in recognition: ${event.error}`;
//        }
//
////    recognition.lang = 'th-TH'
////    recognition.continuous = true; 
////    recognition.interimResults =true; 
////    
////    recognition.addEventLustener('result', fuction(event){
////        const  texts = Array.from(event,results)
////                .map(result => result{0})
////                .map(result => result.transcript)
////                .jpin('')
////        
////        console.log(texts);
////    });
////    
////    recognition.start(); 
//
//        const findFirstDiff2 = function (str1, str2) {
//            return str2[[...str1].findIndex(function (el, index) {
//                return el !== str2[index]
//            })];
//        }
//
//        const findFirstDiff = (str1, str2) =>
//            str2[[...str1].findIndex((el, index) => el !== str2[index])];
//        function getDifference(a, b)
//        {
//            var i = 0;
//            var j = 0;
//            var result = "";
//            while (j < b.length)
//            {
//                if (a[i] != b[j] || i == a.length)
//                    result += b[j];
//                else
//                    i++;
//                j++;
//            }
//            return result;
//        }
//
//        function setGrammar(grammar) {
//            speechrecognitionlist.addFromString(grammar, 1);
//            console.log('Grammar set');
//        }
//
//
//        function controlGameBySpeech(textMsg)
//        {
//            indexGrey = textMsg.indexOf("demo")
//            indexGreen = textMsg.indexOf("okay")
//
//
//            allIndex = [indexGrey, indexGreen];
//            var indexCmd = largestIndex(allIndex);
//            if (indexCmd == 0)
//            {
//                console.log("What sub?");
//                status = 1; 
//            }
//            if (indexCmd == 1 && status == 1)
//            {
//                alert("Thank you");
//                status = 0;
//            }
//        }
//
//
//        function largestIndex(array) {
//            var counter = 1;
//            var max = 0;
//            for (counter; counter < array.length; counter++) {
//                if (array[max] < array[counter]) {
//                    max = counter;
//                }
//            }
//
//            if (array[max] < 0)
//                return -1;
//            else
//                return max;
//
//        }
//    }
//

</script> 


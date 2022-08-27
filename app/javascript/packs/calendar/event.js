/*global $*/
//インストールしたファイルたちを呼び出す。
import { Calendar} from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import monthGridPlugin from '@fullcalendar/daygrid'
import googleCalendarApi from '@fullcalendar/google-calendar'
import { modal} from "bootstrap";

//<div id='calendar'></div>のidからオブジェクトを定義してカレンダーを作る
document.addEventListener('turbolinks:load', function() {

    //カレンダーの中身を設定(月表示)
    var calendar
    var calendarEl = document.getElementById('calendar');
    if (calendarEl) {
        calendar = new Calendar(calendarEl, {
            plugins: [ monthGridPlugin, interactionPlugin, googleCalendarApi ],

            events: '/interviews.json',
            //細かな表示設定
            locale: 'ja',
            timeZone: 'Asia/Tokyo',
            firstDay: 1,
            headerToolbar: {
              start: '',
              center: 'title',
              end: 'today prev,next'
            },
            expandRows: true,
            stickyHeaderDates: true,
            buttonText: {
               today: '今日'
            },
            allDayText: '終日',
            height: "auto",

            dateClick: function(info){
                //日付をクリックしたときのイベント.ajaxではうまく反映されないため、一つずつ記載
                $('body').addClass('modal-open')
                $('#exampleModal').addClass('show')
                $('#exampleModal').css('display', 'block')
                $('#exampleModal').removeAttr('aria-hidden')
                $('#exampleModal').attr('aria-modal', 'true')
                $('#exampleModal').attr('role', 'dialog')
                $('body').append('<div class="modal-backdrop fade show"></div>')
            },

        });
        //カレンダー表示
        calendar.render();
    }
     $(".error").click(function(){
            calendar.refetchEvents();
        });

        $('.close').on('click', function(){
            console.log('test')
            $('body').removeClass('modal-open')
            $('#exampleModal').removeClass('show')
            $('#exampleModal').css('display', 'none')
            $('#exampleModal').attr('aria-hidden', 'true')
            $('#exampleModal').removeAttr('aria-modal')
            $('#exampleModal').removeAttr('role')
            $('.modal-backdrop').remove()
        })
    });



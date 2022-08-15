/*global $*/
//インストールしたファイルたちを呼び出す。
import { Calendar} from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import monthGridPlugin from '@fullcalendar/daygrid'
import googleCalendarApi from '@fullcalendar/google-calendar'

//<div id='calendar'></div>のidからオブジェクトを定義してカレンダーを作る
document.addEventListener('turbolinks:load', function() {


    //カレンダーの中身を設定(月表示)
    var calendar
    var calendarEl = document.getElementById('calendar');
    if (calendarEl) {
        calendar = new Calendar(calendarEl, {
            plugins: [ monthGridPlugin, interactionPlugin, googleCalendarApi ],

            events: '/public/interviews.json',
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
                //日付をクリックしたときのイベント(できたらやる)
                $.ajax({
                type: 'GET',
                url:  './interviews/new',
            }).done(function(res) {
                console.log(res)
                $('.modal-body').html(res)
            }).fail(function(res){
                console.log('失敗')
            })

            },

        });
        //カレンダー表示
        calendar.render();
    }
     $(".error").click(function(){
            calendar.refetchEvents();
        });
    });


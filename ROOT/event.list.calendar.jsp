<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>
    <script>
      $(document).ready(function() {
        $('#calendar').fullCalendar({
          events: [
            {
              title: 'Event 1',
              start: '2022-01-01'
            },
            {
              title: 'Event 2',
              start: '2022-01-05',
              end: '2022-01-07'
            }
          ]
        });
      });
    </script>
  </head>
  <body>
    <div id='calendar'></div>
  </body>
</html>

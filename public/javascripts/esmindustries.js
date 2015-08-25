$(document).ready(function(e) {
  //Uniform Aristo
  $("input, textarea, select").uniform();
  $("input:checkbox").live("click", function() {
    $.uniform.update(
      $(this).attr("checked", this.checked)
    );
  });
  
  //Close modal Press ESC
  $(document).keyup(function(e) { 
    if (e.keyCode == 27) { 
      $().closeModal();
    }
  });
  
  //Only Numbers
  $('.only_numbers').keypress(function (e){
    if( e.which!=8 && e.which!=0 && e.which!=46 && (e.which<48 || e.which>57)){
      return false;
    }
  });
  
  //Click To Buttons Graphs (Left Right)
  $('.left_graph').live("click", function () { moveLeft(); });
  $('.right_graph').live("click", function () { moveRight(); });
  
  // Move Graph for Left
  function moveLeft() {
    $('#slider ul').animate({
      left: + $('#slider ul li').width()
    }, 200, function () {
        $('#slider ul li:last-child').prependTo('#slider ul');
        $('#slider ul').css('left', '');
    });
  };
  
  // Move Graph for Right
  function moveRight() {
    $('#slider ul').animate({
      left: - $('#slider ul li').width()
    }, 200, function () {
        $('#slider ul li:first-child').appendTo('#slider ul');
        $('#slider ul').css('left', '');
    });
  };
});

//Calendar Date Picker
$(function($){
  $.fn.calendarDatePicker = function(options){
    
    var settings = $.extend( {
      'set_date' : undefined,
      'format' : undefined,
      'language' : undefined,
      'hideTime' : undefined,
      'has_event' : undefined,
      'event' : undefined
    }, options);
    
    var element = $(this).attr("id") ;
    
    var set_date = settings.set_date == undefined ? new Date() : new Date(settings.set_date);
    var format = settings.format == undefined ? '%l, %d %F %Y [%H:%i]' : settings.format;
    var language = settings.language == undefined ? 'es' : settings.language;
    var hideTime = settings.hideTime == undefined ? 'false' : settings.hideTime;
    var has_event = settings.has_event == undefined ? false : settings.has_event;
    var event = settings.event == undefined ? null : settings.event;
    
    var CalendarDatePicker;
    CalendarDatePicker = new dhtmlXCalendarObject([element]);
    if(hideTime == "true"){CalendarDatePicker.hideTime();}
    CalendarDatePicker.loadUserLanguage(language);
    CalendarDatePicker.setDate(set_date);
    CalendarDatePicker.setDateFormat(format);

    //Event
    if(has_event){
      CalendarDatePicker.attachEvent("onClick",function(date){
        var fn = window[event];
        fn($.extend(settings.arguments, {date: date}));
      });
    }
  };
});

//Widget Modal
$(function() {
  $('.modal').click(function() {
    $().closeModal();
    var id = $(this).attr('rel') + ".widget";
    //Effect to Open
    $(id).openModal();
    //Passing Params
    var id_row = $(this).attr('id_row'),
        param = $(this).attr('param');
    $(id_row).val(param);
  }); 
  
});

//Open Modal
$(function() {
  $.fn.openModal = function(){
    $().overlay();
    $(this).fadeIn(400);
    $(this).fadeTo("slow",1.0);
  };
});

//Close Modal
$(function() {
  $.fn.closeModal = function(){
    $('.widget').hide();
    $().closeOverlay();
  };
});

//Create Overlay for Modal
$(function() {
  $.fn.overlay = function(){
    var overlay = document.createElement("div");
    overlay.setAttribute("id","overlay");
    overlay.setAttribute("class", "overlay");
    document.body.appendChild(overlay);
  };
});

//Close Overlay for Modal
$(function() {
  $.fn.closeOverlay = function(){
    if(document.getElementById("overlay")){
      document.body.removeChild(document.getElementById("overlay"));
    }
  };
});

// ----------- Intercambio de Opciones --------------
// --------------- Custom Reports -------------------
// --------------------------------------------------
function AddRow(unselectedList,selectedList, strList){
  //I get the selected option. 
  for (i = unselectedList.length - 1; i >= 0; i--) {
    index = i;
    if (unselectedList.options[i].selected) {
      text = unselectedList.options[index].text;
      value = unselectedList.options[index].value;
      objOption = document.createElement("OPTION");
      
      if ( unselectedList.options[index].getAttribute('valuefixed') !== null) {
        objOption.setAttribute('valuefixed',unselectedList.options[index].getAttribute('valuefixed'));
      }
      //Creating a new option 
      
      objOption.text= text;
      objOption.value= value;
      //finally this option is added and deleted from unassigned list.
      selectedList.options.add(objOption);
      removeRow(strList,i);
    }
  }
}

function removeRow(strList, row){
  var elSel = document.getElementById(strList);
  if ( row >= 0 ){
    elSel.remove(row);
  }
}


function selectAllArray(strList){
  var elSel = document.getElementById(strList);
  var rows = elSel.length - 1;
  for (i=0; i <= rows ; i++ ){
    elSel.options[i].selected = true;
  }
}

function unSelectAllArray(strList){
  var elSel = document.getElementById(strList);
  var rows = elSel.length - 1;
  for (i=0; i <= rows ; i++ ){
    elSel.options[i].selected = false;
  }
}

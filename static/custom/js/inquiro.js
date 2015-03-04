var Inquiro = Inquiro || {};

(function(myself) {
    
    myself.opts = {
        timelineTemplate: ''+
            '<ul class="cbp_tmtimeline">'+
            '<% _.each(root, function(value, key) { %> ' +
            '   <li data-value="<%-value.ID%>">'+
            '       <time class="cbp_tmtime" datetime="<%-value.Name%>"><span><%-moment(value["Start Date/Time"]).format("YYYY-MM-DD")%></span> <span><%-moment(value["Start Date/Time"]).format("HH:mm:ss")%></span></time>'+
    		'		<div class="cbp_tmicon cbp_tmicon-phone"></div>'+
    		'		<div class="cbp_tmlabel">'+
    		'			<div class="title">'+
            '               <h2><%-value.ID%></h2>'+
            '           </div>'+
            '           <div class="details">'+
            '               <div class="row">'+
            '                   <div class="col-xs-12 col-md-8">'+
            '                        <div class=""><b>Name:</b> <%-value["Name"]%></div>'+
            '                   </div>'+
            '                   <div class="col-xs-12 col-md-4">'+
            '                       <div class=""><b>User: </b><%-value["Username"]%></div>'+
            '                   </div>'+
            '                   <div class="col-xs-12 col-md-4">'+
            '                       <div class=""><b>Ended at: </b><%-value["End Date/Time"]%></div>'+
            '                   </div>'+
            '                   <div class="col-xs-12 col-md-4">'+
            '                       <div class=""><b>Started at:</b> <%-value["Start Date/Time"]%></div>'+
            '                   </div>'+
            '                   <div class="col-xs-12 col-md-4">'+
            '                       <div class=""><b>Duration (seconds): </b><%-value["Duration (seconds)"]%></div>'+
            '                   </div>'+
            '               </div>'+
            '               <div class="row">'+
            '                   <div class="col-xs-12 col-md-4 summary">'+
            '                       <div class="row">'+
            '                           <div class="col-xs-1 col-md-2">'+
            '                               <div class="stopwatch icon-stopwatch"/>'+
            '                           </div>'+
            '                           <div class="col-xs-11 col-md-10">'+
            '                               <div class="title"><b><%=_.keys(value["task"]["mapper"]).length%> Mappers</b></div>'+
            '                               <div class="redirectTo">(click to get more details)</div>'+
            '                           </div>'+
            '                           <div class="col-xs-12 taskDetails">'+
            '                                   <% _.each(value["task"]["mapper"], function(sValue, sKey) { %> ' +
            '                                       <div class="title fa arrow-circle" title="<%-sKey%>"> <%-sKey%></div>'+
            '                                       <div class="taskSummaryDetails">'+
            '                                           <div>Host: <%-sValue["hostname"]%></div>'+
            '                                           <div>Duration: <%-sValue["duration"]%> (sec) | <%-sValue["status"]%></div>'+
            '                                           <div>Avail. Metrics: PDI (<%-sValue["pdi"].length%>) | Hadoop (<%-_.keys(sValue["hadoop"]).length%>)</div>'+
            '                                       </div>'+
            '                                   <% }); %>' +
            '                           </div>'+
            '                       </div>'+
            '                   </div>'+
            '                   <div class="col-xs-12 col-md-4 summary">'+
            '                       <div class="row">'+
            '                           <div class="col-xs-1 col-md-2">'+
            '                               <div class="stopwatch icon-stopwatch"/>'+
            '                           </div>'+
            '                           <div class="col-xs-11 col-md-10">'+
            '                               <div class="title"><b><%=_.keys(value["task"]["combiner"]).length%> Combiners</b></div>'+
            '                               <div class="redirectTo">(click to get more details)</div>'+
            '                           </div>'+
            '                           <div class="col-xs-12 taskDetails">'+
            '                                   <% _.each(value["task"]["combiner"], function(sValue, sKey) { %> ' +
            '                                       <div class="title fa arrow-circle" title="<%-sKey%>"> <%-sKey%></div>'+
            '                                       <div class="taskSummaryDetails">'+
            '                                           <div>Host: <%-sValue["hostname"]%></div>'+
            '                                           <div>Duration: <%-sValue["duration"]%> (sec) | <%-sValue["status"]%></div>'+
            '                                           <div>Avail. Metrics: PDI (<%-sValue["pdi"].length%>) | Hadoop (<%-_.keys(sValue["hadoop"]).length%>)</div>'+
            '                                       </div>'+
            '                                   <% }); %>' +
            '                           </div>'+
            '                       </div>'+
            '                   </div>'+
            '                   <div class="col-xs-12 col-md-4 summary">'+
            '                       <div class="row">'+
            '                           <div class="col-xs-1 col-md-2">'+
            '                               <div class="stopwatch icon-stopwatch"/>'+
            '                           </div>'+
            '                           <div class="col-xs-11 col-md-10">'+
            '                               <div class="title"><b><%=_.keys(value["task"]["reducer"]).length%> Reducers</b></div>'+
            '                               <div class="redirectTo">(click to get more details)</div>'+
            '                           </div>'+
            '                           <div class="col-xs-12 taskDetails">'+
            '                                   <% _.each(value["task"]["reducer"], function(sValue, sKey) { %> ' +
            '                                       <div class="title fa arrow-circle" title="<%-sKey%>"> <%-sKey%></div>'+
            '                                       <div class="taskSummaryDetails">'+
            '                                           <div>Host: <%-sValue["hostname"]%></div>'+
            '                                           <div>Duration: <%-sValue["duration"]%> (sec) | <%-sValue["status"]%></div>'+
            '                                           <div>Avail. Metrics: PDI (<%-sValue["pdi"].length%>) | Hadoop (<%-_.keys(sValue["hadoop"]).length%>)</div>'+
            '                                       </div>'+
            '                                   <% }); %>' +
            '                           </div>'+
            '                       </div>'+   
            '                   </div>'+
            '               </div>'+
            '           </div>'+
    		'		</div>'+
    		'	</li>'+
            '<% }); %>' +
            '<ul>'
    };

    return myself;
    
})(Inquiro);
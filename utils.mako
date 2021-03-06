<%def name="requirejs(file)" filter="trim">
    <%
        import os
        import requirejs
    %>
    ${requirejs.include(file, filename, '.', local_externals)|n}
</%def>

<%def name="menu_item(location, caption)" filter="trim">
    %if location is None:
        <li class="${'active' if current_location in (i[0] for i in caption[1:]) else ''}">
            ${caption[0]}
            <ul>
            %for l2, c2 in caption[1:]:
                ${menu_item(l2, c2)}
            %endfor
            </ul>
        </li>
    %else:
        %if current_location == location:
            <li class="active">
        %else:
            <li>
        %endif
        <a href="${location}">${caption}</a></li>
    %endif
</%def>

<%def name="main_menu(items)" filter="trim">
    <ul class="nav">
    <li class="first-menu-item"></li>
    % for location, caption in items:
        ${menu_item(location, caption)}
    % endfor
    <li class="last-menu-item"></li>
    </ul>
</%def>

<%def name="current_year()" filter="trim">
    <% import datetime  %>
    ${str(datetime.date.today().year)}
</%def>
<%def name="present_moment()" filter="trim">
    <% import datetime  %>
    ${datetime.datetime.now().strftime('%Y %B %d, %H:%M')}
</%def>


<%def name="google_analytics()">
<script type="text/javascript"> var _gaq = _gaq || []; _gaq.push(['_setAccount', 'UA-42001280-1']); _gaq.push(['_trackPageview']);
(function() { var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s); })();</script>
</%def>

<%def name="disqus_thread(identifier)">
    <hr />
    <div id="disqus_thread"></div>
    <script type="text/javascript">
        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
        var disqus_shortname = 'bunykshumblehomepage'; // required: replace example with your forum shortname
        var disqus_identifier = '${identifier}'; 

        /* * * DON'T EDIT BELOW THIS LINE * * */
        (function() {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>
    <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
    <a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>
</%def> 

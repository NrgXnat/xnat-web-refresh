<%@ tag description="Base Scripts" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pg" tagdir="/WEB-INF/tags/page" %>
<%@ taglib prefix="incl" tagdir="/WEB-INF/tags/page/_incl" %>

<%--## Base JavaScript and CSS--%>

<%--## only load once--%>
<c:if test="${empty baseJS}">

    <!-- load polyfills before ANY other JavaScript -->
    <script src="${SCRIPTS}/polyfills.js"></script>

    <!-- XNAT global functions (no dependencies) -->
    <script src="${SCRIPTS}/globals.js"></script>

    <!-- set global vars that are used often -->
    <script>

        var XNAT = getObject(XNAT);
        var serverRoot = '${SITE_ROOT}';
        var csrfToken = '${csrfToken}';
        <%--
        var showReason = realValue('$!showReason');
        var requireReason = realValue('$!requireReason');
        --%>

    </script>
    <%--## separate script tags so not everything breaks if showReason or requireReason blows up--%>

    <!-- required libraries -->
    <script src="${SCRIPTS}/lib/loadjs/loadjs.js"></script>
    <script src="${SCRIPTS}/lib/jquery/jquery.min.js"></script>
    <script src="${SCRIPTS}/lib/jquery/jquery-migrate.min.js"></script>
    <script>
        // alias jQuery to jq
        var jq = jQuery;
    </script>

    <!-- jQuery plugins -->
    <link rel="stylesheet" type="text/css" href="${SCRIPTS}/lib/jquery-plugins/chosen/chosen.min.css?${versionString}">
    <script src="${SCRIPTS}/lib/jquery-plugins/chosen/chosen.jquery.min.js"></script>
    <script src="${SCRIPTS}/lib/jquery-plugins/jquery.maskedinput.min.js"></script>
    <script src="${SCRIPTS}/lib/jquery-plugins/jquery.hasClasses.js"></script>
    <script src="${SCRIPTS}/lib/jquery-plugins/jquery.dataAttr.js"></script>
    <script src="${SCRIPTS}/lib/jquery-plugins/jquery.form.js"></script>

    <!-- other libraries -->
    <script src="${SCRIPTS}/lib/spawn/spawn.js"></script>
    <script src="${SCRIPTS}/lib/js.cookie.js"></script>
    <script src="${SCRIPTS}/lib/yamljs/dist/yaml.js"></script>
    <script src="${SCRIPTS}/lib/form2js/src/form2js.js"></script>
    <script src="${SCRIPTS}/lib/ace/ace.js"></script>

    <!-- XNAT utility functions -->
    <script src="${SCRIPTS}/utils.js"></script>


    <jsp:doBody/>


    <!-- base-js is loaded -->
    <c:set var="baseJS" value="true" scope="request"/>

</c:if>
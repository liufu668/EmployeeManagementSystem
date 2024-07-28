<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page isELIgnored="false" %>
<c:set var="timestamp" value="20170207"/>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
    if ("/".equals(request.getContextPath())) {
%>
<c:set var="ctx" value=""/>
<%
    }
%>
<script type="text/javascript">
    var ctx = '${ctx}';
    var COMMON_SUCCESS_CODE = 0;//成功
    var COMMON_FAIL_CODE = 1;//失败
</script>
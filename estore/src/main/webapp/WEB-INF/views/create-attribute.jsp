<%--
  ~ MIT License
  ~
  ~ Copyright (c) 2019 Andrei Sidorov
  ~
  ~ Permission is hereby granted, free of charge, to any person obtaining a copy
  ~ of this software and associated documentation files (the "Software"), to deal
  ~ in the Software without restriction, including without limitation the rights
  ~ to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  ~ copies of the Software, and to permit persons to whom the Software is
  ~ furnished to do so, subject to the following conditions:
  ~
  ~ The above copyright notice and this permission notice shall be included in all
  ~ copies or substantial portions of the Software.
  ~
  ~ THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  ~ IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  ~ FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  ~ AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  ~ LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  ~ OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  ~ SOFTWARE.
  --%>
<%@ include file="partials/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Profile</title>
    <%@ include file="partials/head.jsp" %>
</head>
<body>
<%@ include file="partials/topnav.jsp" %>

<main id="create-attribute-main">
    <c:if test="${not empty message}"><div id="message">${message}</div></c:if>
    <c:if test="${not empty error}"><div id="error">${error}</div></c:if>
    <h1>New product attribute</h1>
    <form:form action="/product/${product.id}/attribute/create"
               method="post"
               modelAttribute="attributeDto">
        <ul>
            <form:input type="hidden" path="productId" value="${product.id}" />
            <form:input type="hidden" path="categoryId" value="${product.category.id}" />
            <li>
                <label for="name">Attribute</label>
                <form:input path="name" required="required" />
            </li>
        </ul>
        <button type="submit">Create attribute</button>
    </form:form>
    <a class="go-back-link" href="/product/${product.id}/edit">Go back</a>
</main>
<%@ include file="partials/footer.jsp" %>

</body>
</html>
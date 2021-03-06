<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


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

<c:forEach var="category" items="${categories}" varStatus="count">
    <c:if test="${category.type eq 'folder'}">
        <li>
            <span>
                <a>${category.id} ${category.name}</a>
                <button onclick="deleteFolder(${category.id})">
                    <em class="material-icons">clear</em>
                </button>
                <button onclick="renameFolder(${category.id})">
                    <em class="material-icons">border_color</em>
                </button>
            </span>
            <em class="dropdown-btn material-icons" onclick="toggleCategory(this)">keyboard_arrow_down</em>
        </li>
    </c:if>

    <c:if test="${category.type eq 'category'}">
        <li>
            <span>
                <a>${category.id} ${category.name}</a>
                <button onclick="deleteCategory(${category.id}, '${category.name}')">
                    <em class="material-icons">clear</em>
                </button>
                <button onclick="renameFolder(${category.id})">
                    <em class="material-icons">border_color</em>
                </button>
            </span>
        </li>
    </c:if>

    <ul class="dropdown-container">
        <c:if test="${not empty category.subCategories}">
            <c:set var="categories" value="${category.subCategories}" scope="request"/>
            <jsp:include page="edit-category.jsp"/>
        </c:if>
        <li class="edit-section">
            <button onclick="addFolder(${category.id})">
                <em class="material-icons">create_new_folder</em>
            </button>
            <button onclick="addCategory(${category.id})">
                <em class="material-icons">add</em>
            </button>
        </li>
    </ul>
</c:forEach>



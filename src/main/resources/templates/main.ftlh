<#import "parts/common.ftlh" as c>

<@c.page>
    <form method="get" action="/main" class="row row-cols-lg-auto g-3 align-items-center ms-2">
    <div class="col-12">
        <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder = "Поиск по тэгу"/>
    </div>
    <div class="col-12">
        <button type="submit" class="btn btn-primary">Найти</button>
    </div>
    </form>

<#include "parts/messageEdit.ftlh"/>

<#include "parts/messageList.ftlh"/>

</@c.page>
<#include "security.ftlh">

<div class="row row-cols-3 row-cols-md-2 g-4 m-3" id="message-list">
<#list messages as message>
        <div class="card my-3" style="width: 18rem;" data-id="${message.id}">
            <div class="m-2">
                <span>${message.text}</span><br/>
                <i>#${message.tag}</i>
            </div>
            <div class="card-footer text-muted">
            <a href="/user-messages/${message.author.id}">${message.authorName}</a>
            <#if message.author.id == currentUserId>
            <a class="btn btn-primary" href="/user-messages/${message.author.id}?message=${message.id}">
                Редактировать
            </a>
            </#if>
            </div>
        </div>
<#else>
Нет сообщений
</#list>
</div>
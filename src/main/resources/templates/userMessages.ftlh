<#import "parts/common.ftlh" as c>

<@c.page>

<h3>${userChannel.username}</h3>
<#if !isCurrentUser>
    <#if isSubscriber>
        <a class="btn btn-info m-3" href="/user/unsubscribe/${userChannel.id}">Отписаться</a>
    <#else>
        <a class="btn btn-info m-3" href="/user/subscribe/${userChannel.id}">Подписка</a>
    </#if>
</#if>
<div class="container">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <div class="card-title">Подписки</div>
                    <h3 class="card-text">
                        <a href="/user/subscriptions/${userChannel.id}/list">${subscriptionsCount}</a>
                    </h3>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <div class="card-body">
                     <div class="card-title">Подписчики</div>
                     <h3 class="card-text">
                        <a href="/user/subscribers/${userChannel.id}/list">${subscribersCount}</a>
                     </h3>
                </div>
            </div>
        </div>
    </div>
</div>

    <#if isCurrentUser>
        <#include "parts/messageEdit.ftlh"/>
    </#if>

<#include "parts/messageList.ftlh"/>

</@c.page>
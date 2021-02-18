<#include "security.ftlh">
<#import "login.ftlh" as l>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="/">Тестовый весенний ботинок</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/">Дом</a>
        </li>
        <li class="nav-item">
           <a class="nav-link active" aria-current="page" href="/main">Сообщения</a>
         </li>
         <#if isAdmin>
         <li class="nav-item">
           <a class="nav-link active" aria-current="page" href="/user">Список пользователей</a>
         </li>
         </#if>

         <#if user??>
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/user/profile">Профиль</a>
                  </li>
         </#if>
      </ul>

        <div class="navbar-text me-3">${name}</div>
        <@l.logout />
    </div>
</nav>
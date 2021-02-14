<#macro login path isRegisterForm>
<form action="${path}" method="post">
    <div class="form-group row">
    <label class="col-sm-2 col-form-label"> User Name :
    <div class="col-sm-10">
    <input type="text" name="username" class="form-control" placeholder = "User name"/>
    </div>
    </label>
    </div>

    <div class="form-group row">
    <label class="col-sm-2 col-form-label"> Password:
    <div class="col-sm-10">
    <input type="password" name="password" class="form-control" placeholder = "Password"/>
    </div>
    </label>
    </div>

    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <#if !isRegisterForm>
        <a href="/registration">Add new user</a>
    </#if>
    <button type="submit" class="btn btn-primary"><#if isRegisterForm>Создать<#else>Вход</#if></button>
</form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="btn btn-primary">Выйти</button>
    </form>
</#macro>

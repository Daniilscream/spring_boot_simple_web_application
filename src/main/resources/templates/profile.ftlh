<#import "parts/common.ftlh" as c>

<@c.page>
<h5>${username}</h5>
${message?ifExists}
<form method="post">
    <div class="form-group row">
    <label class="col-sm-2 col-form-label"> Password:
    <div class="col-sm-10">
    <input type="password" name="password" class="form-control" placeholder = "Password"/>
    </div>
    </label>
    </div>

    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Email:
        <div class="col-sm-10">
        <input type="email" name="email" class="form-control" placeholder = "some@some.com" value="${email!''}"/>
        </div>
        </label>
        </div>

    <input type="hidden" name="_csrf" value="${_csrf.token}">

    <button type="submit" class="btn btn-primary">Сохранить</button>
</form>

</@c.page>
<#macro login path isRegisterForm>
<form action="${path}" method="post">
    <div class="form-group row">
    <label class="col-sm-2 col-form-label"> User Name :
    <div class="col-sm-10">
    <input type="text" name="username" value = "<#if user??>${user.username}</#if>"
    class="form-control ${(usernameError??)?string('is-invalid', '')}" placeholder = "User name"/>
                  <#if usernameError??>
                  <div class="invalid-feedback">
                    ${usernameError}
                  </div>
                  </#if>
    </div>
    </label>
    </div>

    <div class="form-group row">
    <label class="col-sm-2 col-form-label"> Password:
    <div class="col-sm-10">
    <input type="password" name="password" class="form-control ${(passwordError??)?string('is-invalid', '')}" placeholder = "Password"/>
                      <#if passwordError??>
                      <div class="invalid-feedback">
                        ${passwordError}
                      </div>
                      </#if>
    </div>
    </label>
    </div>

    <#if isRegisterForm>
    <div class="form-group row">

        <label class="col-sm-2 col-form-label"> Password Confirmation:
        <div class="col-sm-10">
        <input type="password" name="passwordConfirmation"
        class="form-control ${(passwordConfirmationError??)?string('is-invalid', '')}" placeholder = "Retype Password"/>
                          <#if passwordConfirmationError??>
                          <div class="invalid-feedback">
                            ${passwordConfirmationError}
                          </div>
                          </#if>
        </div>
        </label>

        <label class="col-sm-2 col-form-label"> Email:
        <div class="col-sm-10">
        <input type="email" name="email" value = "<#if user??>${user.email}</#if>"
        class="form-control  ${(emailError??)?string('is-invalid', '')}" placeholder = "some@some.com"/>
                                  <#if emailError??>
                                  <div class="invalid-feedback">
                                    ${emailError}
                                  </div>
                                  </#if>
        </div>
        </label>
        </div>
        <div class="col-sm-10">
            <div class="g-recaptcha" data-sitekey="6LdPl2gaAAAAALtARNp2QPsZ0hsSh9-uHfijWyu4"></div>
            <#if captchaError??>
                    <div class="alert alert-danger" role="alert">
                      ${captchaError}
                    </div>
            </#if>
        </div>
    </#if>

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
        <button type="submit" class="btn btn-primary"><#if user??>Выйти<#else>Войти</#if></button>
    </form>
</#macro>

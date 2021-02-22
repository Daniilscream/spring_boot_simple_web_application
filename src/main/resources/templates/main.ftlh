<#import "parts/common.ftlh" as c>

<@c.page>
    <form method="get" action="/main" class="row row-cols-lg-auto g-3 align-items-center ms-2">
    <div class="col-12">
        <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder = "Поиск по тэгу">
    </div>
    <div class="col-12">
        <button type="submit" class="btn btn-primary">Найти</button>
    </div>
    </form>

    <a class="btn btn-primary m-3" data-bs-toggle="collapse" href="#collapseMessage"
    role="button" aria-expanded="false" aria-controls="collapseExample">
        Добавить сообщение
    </a>

<div class="collapse m-3 <#if message??>show</#if>" id="collapseMessage">
    <form method="post" enctype="multipart/form-data" class="row g-3">
        <div class="mb-3">
        <input type="text" name="text" class="form-control ${(textError??)?string('is-invalid', '')}"
        value = "<#if message??>${message.text}</#if>" placeholder="Введите сообщение">
              <#if textError??>
              <div class="invalid-feedback">
                ${textError}
              </div>
              </#if>
        </div>
        <div class="mb-3">
        <input type="text" name="tag" class="form-control ${(tagError??)?string('is-invalid', '')}"
        value = "<#if message??>${message.tag}</#if>" placeholder="Тэг">
                      <#if tagError??>
                      <div class="invalid-feedback">
                        ${tagError}
                      </div>
                      </#if>
        </div>
        <div class="mb-3">
          <input class="form-control" type="file" id="formFile">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div class="col-12">
        <button type="submit" class="btn btn-primary">Добавить</button>
        </div>
    </form>
</div>

<div class="row row-cols-3 row-cols-md-2 g-4 m-3">
<#list messages as message>
        <div class="card my-3" style="width: 18rem;">
            <div class="m-2">
                <span>${message.text}</span>
                <i>${message.tag}</i>
            </div>
            <div class="card-footer text-muted">
            ${message.authorName}
            </div>
        </div>
<#else>
Нет сообщений
</#list>
</div>
</@c.page>
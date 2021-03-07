
<a class="btn btn-primary m-3" data-bs-toggle="collapse" href="#collapseMessage"
    role="button" aria-expanded="false" aria-controls="collapseExample">
        Редактор сообщений
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
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="hidden" name="id" value="<#if message??>${message.id}</#if>"/>
        <div class="col-12">
        <button type="submit" class="btn btn-primary">Сохранить сообщение</button>
        </div>
    </form>
</div>
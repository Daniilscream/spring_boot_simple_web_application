<#import "parts/common.ftlh" as c>
<#impart "parts/login.ftlh" as l>
<@c.page>
Add new user
${message}
<@l.login "/registration"/>
</@c.page>
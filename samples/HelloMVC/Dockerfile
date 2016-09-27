FROM shirhatti/aspnet

RUN mkdir C:\aspnet

RUN powershell -NoProfile -Command \
    Import-module IISAdministration; \
    New-IISSite -Name "ASPNET" -PhysicalPath C:\aspnet -BindingInformation "*:8000:"

EXPOSE 8000

ADD HelloMVC/bin/publish/ /aspnet

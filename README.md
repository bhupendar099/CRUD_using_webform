 # Procedure For Show Detailes
```
CREATE proc USP_Show  
as  
begin  
select *, Cname,Sname from users join tblcountry on users.userCountry=cid   
join tblstate on users.userState=sid;  
end  

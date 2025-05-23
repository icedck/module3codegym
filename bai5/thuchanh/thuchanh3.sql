delimiter //
create procedure getCusById(in cusNum int)
begin
	select * from customers where customerNumber = cusNum;
end
// delimiter ;

call getCusById(175);

delimiter //
create procedure GetCustomersCountByCity(in in_city varchar(50), out total int)
begin
	select count(customerNumber) from customers where city = in_city;
end
// delimiter ;

call GetCustomersCountByCity("Las Vegas", @total);
select @total;

delimiter //
create procedure SetCounter(inout counter int, in inc int)
begin
	set counter = counter + inc;
end
// delimiter ;

set @counter = 1;
call SetCounter(@counter, 1);
call SetCounter(@counter, 1);
call SetCounter(@counter, 5);
select @counter;

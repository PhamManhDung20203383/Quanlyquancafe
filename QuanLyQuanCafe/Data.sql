CREATE DATABASE QuanLyQuanCafe
GO

USE QuanLyQuanCafe
GO

-- Food
-- Table
-- FoodCategory
-- Account
-- Bill
-- BillInfo

CREATE TABLE TableFood
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Bàn chưa có tên',
	status NVARCHAR(100) NOT NULL DEFAULT N'Trống'	-- Trống || Có người
)
GO

CREATE TABLE Account
(
	UserName NVARCHAR(100) PRIMARY KEY,	
	DisplayName NVARCHAR(100) NOT NULL DEFAULT N'Kter',
	PassWord NVARCHAR(1000) NOT NULL DEFAULT 0,
	Type INT NOT NULL  DEFAULT 0 -- 1: admin && 0: staff
)
GO

CREATE TABLE FoodCategory
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên'
)
GO

CREATE TABLE Food
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên',
	idCategory INT NOT NULL,
	price FLOAT NOT NULL DEFAULT 0
	
	FOREIGN KEY (idCategory) REFERENCES dbo.FoodCategory(id)
)
GO

CREATE TABLE Bill
(
	id INT IDENTITY PRIMARY KEY,
	DateCheckIn DATE NOT NULL DEFAULT GETDATE(),
	DateCheckOut DATE,
	idTable INT NOT NULL,
	status INT NOT NULL DEFAULT 0 -- 1: đã thanh toán && 0: chưa thanh toán
	
	FOREIGN KEY (idTable) REFERENCES dbo.TableFood(id)
)
GO

CREATE TABLE BillInfo
(
	id INT IDENTITY PRIMARY KEY,
	idBill INT NOT NULL,
	idFood INT NOT NULL,
	count INT NOT NULL DEFAULT 0
	
	FOREIGN KEY (idBill) REFERENCES dbo.Bill(id),
	FOREIGN KEY (idFood) REFERENCES dbo.Food(id)
)
GO

INSERT INTO dbo.Account
        ( UserName ,
          DisplayName ,
          PassWord ,
          Type
        )
VALUES  ( N'N4' , -- UserName - nvarchar(100)
          N'Nhóm 4' , -- DisplayName - nvarchar(100)
          N'1' , -- PassWord - nvarchar(1000)
          1  -- Type - int
        )
INSERT INTO dbo.Account
        ( UserName ,
          DisplayName ,
          PassWord ,
          Type
        )
VALUES  ( N'Staff' , -- UserName - nvarchar(100)
          N'Nhân viên' , -- DisplayName - nvarchar(100)
          N'1' , -- PassWord - nvarchar(1000)
          0  -- Type - int
        )
GO

-- thêm bàn
DECLARE @i INT = 1
WHILE @i <= 10
BEGIN
	INSERT dbo.TableFood ( name)VALUES  ( N'Bàn ' + CAST(@i AS nvarchar(100)))
	SET @i = @i + 1
END
GO
---

-- thêm category
-- thêm category
INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'Đồ uống'  -- name - nvarchar(100)
          )
INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'Đồ ăn vặt' )
INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'Đồ ăn nhanh' )
INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'Trái cây' )
INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'Đồ nhắm' )

-- thêm món ăn
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Trà tắc', 1, 20000)
--
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Trà bưởi', -- name - nvarchar(100)
          1, -- idCategory - int
          28000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Trà tranh', 1, 20000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Trà bí đao', -- name - nvarchar(100)
          1, -- idCategory - int
          25000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Đen đá không đường', -- name - nvarchar(100)
          1, -- idCategory - int
          30000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Milo dầm', -- name - nvarchar(100)
          1, -- idCategory - int
          10000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Trà đào cam sả', 1, 25000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Trà matcha', 1, 30000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Snack khoai tây', 2, 10000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Snack bắp ngọt', 2, 10000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Snack tôm cay', 2, 10000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Snack phomat', 2, 10000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Snack bí đỏ', 2, 10000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Snack cà chua', 2, 10000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Snack hành', 2, 10000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Snack cua', 2, 10000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Snack da heo', 2, 10000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Thịt bò khô', 3, 25000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Thịt lợn khô', 3, 25000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Nộm bò khô', 3, 30000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Nem chua rán', 3, 50000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Chân gà sả tắc', 3, 60000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Khoai lắc phomai', 3, 45000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Xúc xích chiên', 3, 35000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Hoa quả dầm tổng hợp', 4, 30000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Hoa quả sấy', 4, 40000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Chè hoa quả tổng hợp', 4, 40000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Chè bưởi', 4, 20000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Chè xoài', 4, 20000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Chè khoai dẻo', 4, 20000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Chè mít', 4, 30000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Sữa chua nếp cẩm', 4, 25000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Lạc', 5, 15000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Mực nướng', 5, 50000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Da heo chiên giòn', 5, 30000)
--
--
select * from Food
select * from FoodCategory
--
ALTER TABLE dbo.Bill
ADD discount INT
GO

UPDATE dbo.Bill SET discount = 0
GO

delete billInfo
go
delete bill
go

ALTER TABLE dbo.Bill ADD totalPrice FLOAT
GO
---------------------------------------------------
------------------- TRIGGER -----------------------
---------------------------------------------------
CREATE TRIGGER UTG_DeleteBillInfo
ON dbo.BillInfo FOR DELETE
AS 
BEGIN
	DECLARE @idBillInfo INT
	DECLARE @idBill INT
	SELECT @idBillInfo = id, @idBill = Deleted.idBill FROM Deleted
	
	DECLARE @idTable INT
	SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill
	
	DECLARE @count INT = 0
	
	SELECT @count = COUNT(*) FROM dbo.BillInfo AS bi, dbo.Bill AS b WHERE b.id = bi.idBill AND b.id = @idBill AND b.status = 0
	
	IF (@count = 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable
END
GO
--
CREATE TRIGGER UTG_UpdateBill
ON dbo.Bill FOR UPDATE
AS
BEGIN
	DECLARE @idBill INT
	
	SELECT @idBill = id FROM Inserted	
	
	DECLARE @idTable INT
	
	SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill
	
	DECLARE @count int = 0
	
	SELECT @count = COUNT(*) FROM dbo.Bill WHERE idTable = @idTable AND status = 0
	
	IF (@count = 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable
END
GO
--
CREATE TRIGGER UTG_UpdateBillInfo
ON dbo.BillInfo FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @idBill INT
	
	SELECT @idBill = idBill FROM Inserted
	
	DECLARE @idTable INT
	
	SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill AND status = 0	
	
	DECLARE @count INT
	SELECT @count = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idBill
	
	IF (@count > 0)
	BEGIN
	
		PRINT @idTable
		PRINT @idBill
		PRINT @count
		
		UPDATE dbo.TableFood SET status = N'Có người' WHERE id = @idTable		
	END		
	ELSE
	BEGIN
	PRINT @idTable
		PRINT @idBill
		PRINT @count
	UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable	
	END
	
END
GO
---------------------------------------------
---------------PROCEDURE---------------------
---------------------------------------------
CREATE PROC USP_GetAccountByUserName
@userName nvarchar(100)
AS 
BEGIN
	SELECT * FROM dbo.Account WHERE UserName = @userName
END
GO
--
CREATE PROC USP_Login
@userName nvarchar(100), @passWord nvarchar(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE UserName = @userName AND PassWord = @passWord
END
GO
--
CREATE PROC USP_GetTableList
AS SELECT * FROM dbo.TableFood
GO
--
CREATE PROC USP_InsertBill
@idTable INT
AS
BEGIN
	INSERT dbo.Bill 
	        ( DateCheckIn ,
	          DateCheckOut ,
	          idTable ,
	          status,
	          discount
	        )
	VALUES  ( GETDATE() , -- DateCheckIn - date
	          NULL , -- DateCheckOut - date
	          @idTable , -- idTable - int
	          0,  -- status - int
	          0
	        )
END
GO
--
CREATE PROC USP_InsertBillInfo
@idBill INT, @idFood INT, @count INT
AS
BEGIN
	DECLARE @isExitsBillInfo INT
	DECLARE @foodCount INT = 1
	
	SELECT @isExitsBillInfo = id, @foodCount = b.count 
	FROM dbo.BillInfo AS b 
	WHERE idBill = @idBill AND idFood = @idFood

	IF (@isExitsBillInfo > 0)
	BEGIN
		DECLARE @newCount INT = @foodCount + @count
		IF (@newCount > 0)
			UPDATE dbo.BillInfo	SET count = @foodCount + @count WHERE idFood = @idFood
		ELSE
			DELETE dbo.BillInfo WHERE idBill = @idBill AND idFood = @idFood
	END
	ELSE
	BEGIN
		INSERT	dbo.BillInfo
        ( idBill, idFood, count )
		VALUES  ( @idBill, -- idBill - int
          @idFood, -- idFood - int
          @count  -- count - int
          )
	END
END
GO
--
CREATE PROC USP_SwitchTabel
@idTable1 INT, @idTable2 int
AS BEGIN

	DECLARE @idFirstBill int
	DECLARE @idSeconrdBill INT
	
	DECLARE @isFirstTablEmty INT = 1
	DECLARE @isSecondTablEmty INT = 1
	
	
	SELECT @idSeconrdBill = id FROM dbo.Bill WHERE idTable = @idTable2 AND status = 0
	SELECT @idFirstBill = id FROM dbo.Bill WHERE idTable = @idTable1 AND status = 0
	
	PRINT @idFirstBill
	PRINT @idSeconrdBill
	PRINT '-----------'
	
	IF (@idFirstBill IS NULL)
	BEGIN
		PRINT '0000001'
		INSERT dbo.Bill
		        ( DateCheckIn ,
		          DateCheckOut ,
		          idTable ,
		          status
		        )
		VALUES  ( GETDATE() , -- DateCheckIn - date
		          NULL , -- DateCheckOut - date
		          @idTable1 , -- idTable - int
		          0  -- status - int
		        )
		        
		SELECT @idFirstBill = MAX(id) FROM dbo.Bill WHERE idTable = @idTable1 AND status = 0
		
	END
	
	SELECT @isFirstTablEmty = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idFirstBill
	
	PRINT @idFirstBill
	PRINT @idSeconrdBill
	PRINT '-----------'
	
	IF (@idSeconrdBill IS NULL)
	BEGIN
		PRINT '0000002'
		INSERT dbo.Bill
		        ( DateCheckIn ,
		          DateCheckOut ,
		          idTable ,
		          status
		        )
		VALUES  ( GETDATE() , -- DateCheckIn - date
		          NULL , -- DateCheckOut - date
		          @idTable2 , -- idTable - int
		          0  -- status - int
		        )
		SELECT @idSeconrdBill = MAX(id) FROM dbo.Bill WHERE idTable = @idTable2 AND status = 0
		
	END
	
	SELECT @isSecondTablEmty = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idSeconrdBill
	
	PRINT @idFirstBill
	PRINT @idSeconrdBill
	PRINT '-----------'

	SELECT id INTO IDBillInfoTable FROM dbo.BillInfo WHERE idBill = @idSeconrdBill
	
	UPDATE dbo.BillInfo SET idBill = @idSeconrdBill WHERE idBill = @idFirstBill
	
	UPDATE dbo.BillInfo SET idBill = @idFirstBill WHERE id IN (SELECT * FROM IDBillInfoTable)
	
	DROP TABLE IDBillInfoTable
	
	IF (@isFirstTablEmty = 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable2
		
	IF (@isSecondTablEmty= 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable1
END
GO
--
CREATE PROC USP_GetListBillByDate
@checkIn date, @checkOut date
AS 
BEGIN
	SELECT t.name AS [Tên bàn], b.totalPrice AS [Tổng tiền], DateCheckIn AS [Ngày vào], DateCheckOut AS [Ngày ra], discount AS [Giảm giá]
	FROM dbo.Bill AS b,dbo.TableFood AS t
	WHERE DateCheckIn >= @checkIn AND DateCheckOut <= @checkOut AND b.status = 1
	AND t.id = b.idTable
END
GO
--
CREATE PROC USP_UpdateAccount
@userName NVARCHAR(100), @displayName NVARCHAR(100), @password NVARCHAR(100), @newPassword NVARCHAR(100)
AS
BEGIN
	DECLARE @isRightPass INT = 0
	
	SELECT @isRightPass = COUNT(*) FROM dbo.Account WHERE USERName = @userName AND PassWord = @password
	
	IF (@isRightPass = 1)
	BEGIN
		IF (@newPassword = NULL OR @newPassword = '')
		BEGIN
			UPDATE dbo.Account SET DisplayName = @displayName WHERE UserName = @userName
		END		
		ELSE
			UPDATE dbo.Account SET DisplayName = @displayName, PassWord = @newPassword WHERE UserName = @userName
	end
END
GO
------------------------- FUNCTION -> chuyen doi chu thanh khong dau ---------------------------
CREATE FUNCTION [dbo].[fuConvertToUnsign1] ( @strInput NVARCHAR(4000) ) RETURNS NVARCHAR(4000) AS BEGIN IF @strInput IS NULL RETURN @strInput IF @strInput = '' RETURN @strInput DECLARE @RT NVARCHAR(4000) DECLARE @SIGN_CHARS NCHAR(136) DECLARE @UNSIGN_CHARS NCHAR (136) SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệế ìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵý ĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍ ÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ' +NCHAR(272)+ NCHAR(208) SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeee iiiiiooooooooooooooouuuuuuuuuuyyyyy AADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIII OOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD' DECLARE @COUNTER int DECLARE @COUNTER1 int SET @COUNTER = 1 WHILE (@COUNTER <=LEN(@strInput)) BEGIN SET @COUNTER1 = 1 WHILE (@COUNTER1 <=LEN(@SIGN_CHARS)+1) BEGIN IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1)) = UNICODE(SUBSTRING(@strInput,@COUNTER ,1) ) BEGIN IF @COUNTER=1 SET @strInput = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)-1) ELSE SET @strInput = SUBSTRING(@strInput, 1, @COUNTER-1) +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)- @COUNTER) BREAK END SET @COUNTER1 = @COUNTER1 +1 END SET @COUNTER = @COUNTER +1 END SET @strInput = replace(@strInput,' ','-') RETURN @strInput END
GO
--
CREATE PROC USP_GetListBillByDateAndPage
@checkIn date, @checkOut date, @page int
AS 
BEGIN
	DECLARE @pageRows INT = 10
	DECLARE @selectRows INT = @pageRows
	DECLARE @exceptRows INT = (@page - 1) * @pageRows
	
	;WITH BillShow AS( SELECT b.ID, t.name AS [Tên bàn], b.totalPrice AS [Tổng tiền], DateCheckIn AS [Ngày vào], DateCheckOut AS [Ngày ra], discount AS [Giảm giá]
	FROM dbo.Bill AS b,dbo.TableFood AS t
	WHERE DateCheckIn >= @checkIn AND DateCheckOut <= @checkOut AND b.status = 1
	AND t.id = b.idTable)
	
	SELECT TOP (@selectRows) * FROM BillShow WHERE id NOT IN (SELECT TOP (@exceptRows) id FROM BillShow)
END
GO
--
CREATE PROC USP_GetNumBillByDate
@checkIn date, @checkOut date
AS 
BEGIN
	SELECT COUNT(*)
	FROM dbo.Bill AS b,dbo.TableFood AS t
	WHERE DateCheckIn >= @checkIn AND DateCheckOut <= @checkOut AND b.status = 1
	AND t.id = b.idTable
END
GO
--
--


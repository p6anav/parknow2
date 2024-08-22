Existing user
———————————

1. User profile creation through app-email id and vehicle number 
2. He can book the slots based on the availability.
3. He can just enter by scanning the number because number is already in the system.
4. He can select the duration of parking also and he can do the payment also.
5. If not then he can pay after completing the parking
6. He should get notification in app that his parking time done he needs to recharge or take the vehicle
7. He should see the available parking slots around his are through scanning


New User
——————
1. He can enter he can park by scanning the car number ,date and payment status will save in db.
2. Automated slot allocation no preference just allocate on FIFO
3. He can later scan a QR code and he can enter email id ,password and he can see the rest of the details in app
4. If he wants to recharge the time also he needs app.
5. Once he ready to take the car then if he is an app user he will get a link or window to finish the payment or we will provide another QR code for payment for non app user.
6. If status is paid and user is not black listed only gate will open.


Admin User.
——————

1. Admin user can see all live parking and history of parking based on dates in screen
2. He can expand each entry in dash board and he should see all details of that particular user.
3. He can do some actions like black listing a theft vehicle ,removing a user from system 
4. If any issues admin can do the allocation of slots based on his wish or app user request 

Roles: NEW_USER,ADMIN_USER,EXISTING_USER
Responsibilities: NEW_USER- no access to app or any application untill or unless he becomes EXISTING_USER, He can scan the QR through that link he can do payment or profile creation
EXISTING_USER - He can do booking, seeing the slots, seeing the remaining time , payment,cancellations
ADMIN_USER- Super User all access he is having

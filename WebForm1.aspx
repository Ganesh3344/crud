<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script type="text/javascript" src="Validation.js"></script>
</head>
    
<body>
    
        <div class="container">
        <h2>Student Details..</h2>

        <form id="registrationForm" runat="server">
            <div class="form-group">
                <label for="txtstudentID" >StudentID:</label>
                          
            <asp:TextBox ID="txtstudentID" class="form-control" placeholder="Your StudentID"  runat="server" Height="29px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="txtstudentIDvalidator" runat="server" ControlToValidate="txtstudentID"   ForeColor ="Red" ErrorMessage="Please Enter a StudentID "></asp:RequiredFieldValidator>
                 </div>

            <div class="form-group">
                <label for="txtName">Name:</label>
                      
            <asp:TextBox ID="txtName" class="form-control" placeholder="Your Name"  runat="server" Height="29px"></asp:TextBox>
           <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"   ForeColor ="Red" ErrorMessage="Please Enter a Name "></asp:RequiredFieldValidator>--%>
                  </div>

            <div class="form-group">
                <label for="txtDOB">Date of Birth:</label>
               
                <asp:TextBox ID="txtDOB" class="form-control" placeholder="Your DOB"  runat="server" Height="29px"></asp:TextBox>
                <asp:RangeValidator ID="txtDOB1" runat="server" ControlToValidate="txtDOB" ForeColor ="Red" ErrorMessage="DOB must be Between 2002 to 2020" MinimumValue="2002-01-01" MaximumValue="2020-01-01" Type="Date" Text="Enter Valid Date.." ></asp:RangeValidator>
            </div>


            <div class="form-group">
                <label for="txtAddress">Address:</label>
                            
            <asp:TextBox ID="txtAddress" class="form-control" placeholder= "Your Address"  runat="server" Height="29px"></asp:TextBox>
          <%-- <asp:RequiredFieldValidator ID="txtaddressvalidator" runat="server" ControlToValidate="txtaddress"   ForeColor ="Red" ErrorMessage="Please Enter a Address "></asp:RequiredFieldValidator>--%>

            </div>
            <div class="form-group">

                <label for="txtEmail">Email Address:</label>
             
     
            <asp:TextBox ID="txtEmail" class="form-control" placeholder="Your Mail"  runat="server" Height="29px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="Please Enter a Valid Email..." ControlToValidate="txtEmail"  ForeColor ="Red" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic"></asp:RegularExpressionValidator>
  
      </div> 


         <div class="form-group">
             <label for ="txtgender" id="txtgender">Gender: </label> 
                <asp:RadioButton ID="rbmale"  runat ="server" Text="Male" GroupName="gendergroup" />
                 <asp:RadioButton ID="rbfemale" runat="server" Text="Female" GroupName="gendergroup" />

             </div>
        <div>
           

                                    
              <label class="form-group" for="txtHobbies">Hobbies: </label>
                    <input type="checkbox" name="hobbies" id="chkplay" value="Playing" runat="server"/>Playing
                        
                   <input type="checkbox" name="hobbies" id="chkwriting" value="Writing" runat="server"/>Writing
                   <input type="checkbox" name="hobbies" id="chkmusic" value="Music" runat="server"/>Music 

            </div>
                 <asp:Button ID="btnsubmit" runat="server" Text="Submit"  OnClick="txtSubmit_Click" BackColor="#FFFF66" BorderColor="Blue" Font-Bold="True" Font-Italic="False" Font-Names="Arial" Height="33px" Width="69px"/>
                 <asp:Button ID="btnedit" runat="server" Text="Get" OnClick="txtUpdate_Click" BackColor="Lime" Font-Bold="True" Height="33px" Width="69px" />
                 <asp:Button ID="Button1" runat="server" Font-Bold="True" Height="33px" OnClick="Button1_Click" Text="Update" Width="69px" />
                 <asp:Button ID="Button2" runat="server" BackColor="Red" Font-Bold="True" OnClick="Button2_Click" Text="Delete" Height="33px" Width="69px" OnClientClick="return confirm('Are you sure to delete.?');" />
             <br />
               <asp:GridView ID="GridView1" runat="server" Width="1154px" BackColor="#FF99FF" BorderColor="#660066" BorderStyle="Solid">
            </asp:GridView>
               </div>
        
    <script  type="text/javascript" src ="Validation.js"></script>
           

</body>
    </form>
            <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
           
</html>


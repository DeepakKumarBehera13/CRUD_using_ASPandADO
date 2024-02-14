<%@ Page Title="" Language="C#" MasterPageFile="~/HomePage.Master" AutoEventWireup="true" CodeBehind="DetailsPage.aspx.cs" Inherits="CRUD.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 990px;
        }
        .dr{
            font-family:Segoe UI Semibold;
            font-size:20px;
            width:150px;
            height:30px;
            border:1px solid #D1D1D1;
            outline:0px;
            padding-left:5px;
        }
        .auto-style5 {
            width: 990px;
            background-color: #00FFFF;
        }
        .auto-style8 {
            width: 990px;
            background-color: #FFFFFF;
        }
        .auto-style9 {
            width: 163px;
            background-color: #FFFFFF;
        }
        .auto-style10 {
            margin-right: 2px;
        }
        .auto-style11 {
            width: 990px;
            background-color: #FFFFFF;
            text-align: right;
        }
    </style>
    <script>
        function Valid_EmpDetails()
        {
            debugger;
            var FirstName, LastName, Photo, Qualification, DateOfBirth, Age, DateOfJoin, City, District, State, Country, PinCode;
            FirstName = document.getElementById('<%= txt_FirstName.ClientID %>').value;
            LastName = document.getElementById('<%= txt_LastName.ClientID %>').value;
            Photo = document.getElementById('<%= File_Photo.ClientID %>').value;
            Qualification = document.getElementById('<%= DD_Qualification.ClientID %>').value;
            DateOfBirth = document.getElementById('<%= txt_DOB.ClientID %>').value;
            Age = document.getElementById('<%= txt_Age.ClientID %>').value;
            DateOfJoin = document.getElementById('<%= txt_DOJ.ClientID %>').value;
            City = document.getElementById('<%= DD_City.ClientID %>').value;
            District = document.getElementById('<%= DD_District.ClientID %>').value;
            State = document.getElementById('<%= DD_State.ClientID %>').value;
            Country = document.getElementById('<%= DD_Country.ClientID %>').value;
            PinCode = document.getElementById('<%= txt_PinCode.ClientID %>').value;
            if (FirstName == '' && LastName == '' && Photo == '' && Qualification == '' && DateOfBirth == '' && Age == '' && 
                DateOfJoin=='' && City=='' && District=='' && State=='' && Country=='' && PinCode=='')
            {
                alert("Enter All Fields!!!");
                return false;
            }
            if (FirstName == '')
            {
                alert("Enter First Name");
                return false;
            }
            if (LastName == '')
            {
                alert("Enter Last Name");
                return false;
            }
            if (Photo == '')
            {
                alert("Select Photo");
                return false;
            }
            if (Qualification == '')
            {
                alert("Enter Qualification");
                return false;
            }
            if (DateOfBirth == '')
            {
                alert("Enter Date of Birth");
                return false;
            }
            if (Age == '')
            {
                alert("Enter ur Age");
                return false;
            }
            if (DateOfJoin == '')
            {
                alert("Enter Date Of Join");
                return false;
            }
            if (City == '')
            {
                alert("Select City");
                return false;
            }
            if (District == '')
            {
                alert("Select District");
                return false;
            }
            if (State == '')
            {
                alert("Select State");
                return false;
            }
            if (Country == '')
            {
                alert("Select Country");
                return false;
            }
            if (Country == '')
            {
                alert("Enter Pincode");
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style11">
                        <asp:Button ID="Btn_SignOut" runat="server" CausesValidation="False" Text="SIGNOUT" OnClick="Btn_SignOut_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">EMP ID&nbsp;</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="txt_Id" runat="server" CssClass="dr" Font-Bold="True" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">FIRST NAME</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="txt_FirstName" runat="server" CssClass="dr" Font-Bold="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_FName" runat="server" ControlToValidate="txt_FirstName" Display="None" ErrorMessage="ENTER FIRST NAME" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">LAST NAME</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="txt_LastName" runat="server" CssClass="dr" Font-Bold="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_LName" runat="server" ControlToValidate="txt_LastName" Display="None" ErrorMessage="ENTER LAST NAME" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">PHOTO</td>
                    <td class="auto-style8">
                        <asp:FileUpload ID="File_Photo" runat="server" CssClass="dr" />
                        <asp:RequiredFieldValidator ID="rfv_Photo" runat="server" ControlToValidate="File_Photo" Display="None" ErrorMessage="SELECT PHOTO" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">GENDER</td>
                    <td class="auto-style8">
                        <asp:RadioButton ID="rdb_MALE" runat="server" Font-Bold="True" GroupName="GENDER" Text="MALE" />
                        <asp:RadioButton ID="rdb_FEMALE" runat="server" Font-Bold="True" GroupName="GENDER" Text="FEMALE" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">QUALIFICATION</td>
                    <td class="auto-style8">
                        <asp:DropDownList ID="DD_Qualification" runat="server" CssClass="dr" Font-Bold="True">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfv_Qualification" runat="server" ControlToValidate="DD_Qualification" Display="None" ErrorMessage="SELECT QUALIFICATION" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">MOBILE</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="txt_Mobile" runat="server" CssClass="dr" MaxLength="12" ReadOnly="True" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">EMAIL</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="txt_Email" runat="server" CssClass="dr" ReadOnly="True" TextMode="Email"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">USERNAME</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="txt_UserName" runat="server" CssClass="dr" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">DATE OF BIRTH</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="txt_DOB" runat="server" CssClass="dr" Font-Bold="True" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_DOB" runat="server" ControlToValidate="txt_DOB" Display="None" ErrorMessage="ENTER DATE OF BIRTH" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">AGE</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="txt_Age" runat="server" CssClass="dr" Font-Bold="True" MaxLength="3" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_Age" runat="server" ControlToValidate="txt_Age" Display="None" ErrorMessage="ENTER AGE" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">DATE OF JOIN</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="txt_DOJ" runat="server" CssClass="dr" Font-Bold="True" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_DOJ" runat="server" ControlToValidate="txt_DOJ" Display="None" ErrorMessage="ENTER DATE OF JOIN" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">CITY</td>
                    <td class="auto-style8">
                        <asp:DropDownList ID="DD_City" runat="server" CssClass="dr" Font-Bold="True">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfv_City" runat="server" ControlToValidate="DD_City" Display="None" ErrorMessage="SELECT CITY" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">DISTRICT</td>
                    <td class="auto-style8">
                        <asp:DropDownList ID="DD_District" runat="server" CssClass="dr" Font-Bold="True">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfv_District" runat="server" ControlToValidate="DD_District" Display="None" ErrorMessage="SELECT DISTRICT" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">STATE</td>
                    <td class="auto-style8">
                        <asp:DropDownList ID="DD_State" runat="server" CssClass="dr" Font-Bold="True">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfv_State" runat="server" ControlToValidate="DD_State" Display="None" ErrorMessage="SELECT STATE" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">COUNTRY</td>
                    <td class="auto-style8">
                        <asp:DropDownList ID="DD_Country" runat="server" CssClass="dr" Font-Bold="True">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfv_Country" runat="server" ControlToValidate="DD_Country" Display="None" ErrorMessage="SELECT COUNTRY" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">PIN CODE</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="txt_PinCode" runat="server" CssClass="dr" Font-Bold="True" MaxLength="6" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_PinCode" runat="server" ControlToValidate="txt_PinCode" Display="None" ErrorMessage="ENTER PIN CODE" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:Button ID="Btn_Save" runat="server" Font-Bold="True" Width="100px" Height="20px" Text="SAVE" OnClick="Btn_Save_Click" OnClientClick="Valid_EmpDetails();" />
                        <asp:Button ID="Btn_Cancel" runat="server" Font-Bold="True" Width="100px" Height="20px" Text="CANCEL" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                            GridLines="None" OnPageIndexChanging="Disp" OnRowEditing="Edit" OnRowCancelingEdit="Cancel">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl2_Emp_Id" runat="server" Text='<%# Eval("Emp_Id") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl1_EmpId" runat="server" Text='<%# Eval("Emp_Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FIRST NAME">
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl2_FName" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl1_FName" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="LAST NAME">
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl2_LName" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl1_LName" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PHOTO">
                                    <EditItemTemplate>
                                        <asp:Image ID="img2_Photo" runat="server" Height="85px" ImageUrl='<%# Eval("Photo") %>' Width="85px" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="img1_Photo" runat="server" Height="85px" ImageUrl='<%# Eval("Photo") %>' Width="85px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="QUALIFICATION">
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl2_Qualification" runat="server" Text='<%# Eval("Qualification") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl1_Qualification" runat="server" Text='<%# Eval("Qualification") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DOB">
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl2_DOB" runat="server" Text='<%# Eval("DateOfBirth") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl1_DOB" runat="server" Text='<%# Eval("DateOfBirth") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DOJ">
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl2_DOJ" runat="server" Text='<%# Eval("DateOfJoin") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl1_DOJ" runat="server" Text='<%# Eval("DateOfJoin") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="MOBILE">
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl2_Mobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl1_Mobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EMAIL">
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl2_Email" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl1_Email" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CreatedOn">
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl2_CreatedOn" runat="server" Text='<%# Eval("dtm_CreatedOn") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl1_CreatedOn" runat="server" Text='<%# Eval("dtm_CreatedOn") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EDIT">
                                    <ItemTemplate>
                                        <asp:Button ID="Btn_Edit" runat="server" CausesValidation="False" CommandArgument='<%# Eval("Emp_Id") %>' OnClick="Btn_Edit_Click" Text="EDIT" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="REMOVE">
                                    <ItemTemplate>
                                        <asp:Button ID="Btn_Delete" runat="server" CausesValidation="False" CommandArgument='<%# Eval("Emp_Id") %>' OnClick="Btn_Delete_Click" Text="DELETE" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sigortali.aspx.cs" Inherits="BupaBootcamp.Webform.Sigortali" %>


<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="assent/css/bootstrap.min.css">
    <title>Başvuru Formu</title>
</head>
<body>
    <div class="container">
        <br>
        <h3>Sağlık Sigortası Başvuru Formu</h3>
        <h4>Sigortalı Girişi</h4>
        <div class="col-md-6 form-group">
            <form id="form1" runat="server">
                <div class="row">
                    <div class="col-md-6">
                        <label>Adı</label>
                        <asp:TextBox CssClass="form-control" ID="adi" runat="server" required="required"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label>Soyadı</label>
                        <asp:TextBox CssClass="form-control" ID="soyadi" runat="server" required="required"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label>Tc Kimlik No</label>
                        <asp:TextBox CssClass="form-control" ID="tckimlikno" runat="server" TextMode="Number" required="required"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label>Cinsiyet</label>
                        <asp:DropDownList CssClass="form-control" ID="cinsiyet" runat="server">
                            <asp:ListItem>E</asp:ListItem>
                            <asp:ListItem>K</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label>Doğum tarihi</label>
                        <asp:TextBox CssClass="form-control" ID="dogumtarihi" runat="server" TextMode="Date" required="required"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label>Gsm</label>
                        <asp:TextBox CssClass="form-control" ID="telefon" runat="server" TextMode="Phone" required="required"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label>Email</label>
                        <asp:TextBox CssClass="form-control" ID="email" runat="server" TextMode="Email" required="required"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <label>Medeni Durum</label>
                        <asp:DropDownList CssClass="form-control" ID="medenidurum" runat="server">
                            <asp:ListItem>Bekar</asp:ListItem>
                            <asp:ListItem>Evli</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        <label>Yakınlık</label>
                        <asp:DropDownList CssClass="form-control" ID="yakinlik" runat="server">
                            <asp:ListItem>Kendisi</asp:ListItem>
                            <asp:ListItem>Eşi</asp:ListItem>
                            <asp:ListItem>Çocuğu</asp:ListItem>
                            <asp:ListItem>...</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label>Meslek</label>
                        <asp:TextBox CssClass="form-control" ID="meslek" runat="server" required="required"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label>Boy</label>
                        <asp:TextBox CssClass="form-control" ID="boy" runat="server" TextMode="Number" required="required"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label>Kilo</label>
                        <asp:TextBox CssClass="form-control" ID="kilo" runat="server" TextMode="Number" required="required"></asp:TextBox>
                    </div>
                </div>
                <label>Adres</label>
                <asp:TextBox CssClass="form-control" ID="adres" runat="server" TextMode="MultiLine" required="required"></asp:TextBox>
                <asp:CheckBox ID="sigortalitasi" runat="server" Checked="false" Text="Sigorta ettiren aynı zamanda sigortalıdır." OnCheckedChanged="sigortalitasi_CheckedChanged" AutoPostBack="True" />
                <br>
                <label>Sigortalı Aday Listesi</label>
                <br />
                <asp:GridView ID="adaytablosu" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seç" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <Columns>
                        <asp:BoundField HeaderText="Sigortalı Adı" DataField="FirstName" />
                        <asp:BoundField HeaderText="Soyadı       " DataField="LastName" />
                        <asp:BoundField HeaderText="Cinsiyet" DataField="Gender" />
                        <asp:BoundField HeaderText="Medeni Durum" DataField="MartialStatus" />
                        <asp:BoundField HeaderText="Yakınlık     " DataField="Relationship" />
                        <asp:BoundField HeaderText="Meslek       " DataField="Profession" />
                    </Columns>
                </asp:GridView>
                <br>
                <div class="row">
                    <div class="d-flex justify-content-start col-md-4">
                        <asp:Button CssClass="btn btn-warning" ID="sigortaettiren" runat="server" Text="<- Sigorta Ettiren Girişi" OnClick="sigortaettiren_Click" UseSubmitBehavior="False" />
                    </div>
                    <div class="d-flex justify-content-center col-md-3">
                        <asp:Button CssClass="btn btn-primary" ID="sigortaliekle" runat="server" Text="Sigortalı Ekle" OnClick="sigortaliekle_Click" />
                    </div>
                    <div class="d-flex justify-content-center col-md-1">
                        <asp:Button CssClass="btn btn-danger" ID="sil" runat="server" Text="Sil" OnClick="sil_Click" UseSubmitBehavior="False" />
                    </div>
                    <div class="d-flex justify-content-end col-md-4">
                        <asp:Button CssClass="btn btn-success" ID="urunsecimi" runat="server" Text="Ürün Seçimi ->" OnClick="urunsecimi_Click" UseSubmitBehavior="False" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>

<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="101.aspx.cs" Inherits="NestedGridviews._101" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="pnlCustomers" runat="server">
    <ContentTemplate>
    <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="false" CssClass="Grid"
        DataKeyNames="id" AllowPaging="true" PageSize="6" OnRowDataBound="OnRowDataBound" OnPageIndexChanging="gvCustomers_PageIndexChanging">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <img alt="" style="cursor: pointer;" src="images/plus.png" />                   
                    <asp:UpdatePanel ID="pnlOrders" UpdateMode="Conditional" runat="server" Style="display: none;">
                        <ContentTemplate>
                            <asp:GridView ID="gvOrders" AllowPaging="true" OnPageIndexChanging="gvOrders_PageIndexChanging" PageSize="6" runat="server" AutoGenerateColumns="false" CssClass="ChildGrid">
                                <Columns>
                                    <asp:BoundField ItemStyle-Width="150px" DataField="id" HeaderText="Order Id" />
                                    <asp:BoundField ItemStyle-Width="150px" DataField="order_date" HeaderText="Date" />
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField ItemStyle-Width="150px" DataField="first_name" HeaderText="First Name" />
            <asp:BoundField ItemStyle-Width="150px" DataField="last_name" HeaderText="Last Name" />
            <asp:BoundField ItemStyle-Width="150px" DataField="city" HeaderText="City" />
        </Columns>
    </asp:GridView>
    </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $("[src*=plus]").live("click", function () {
            $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
            $(this).attr("src", "images/minus.png");
        });
        $("[src*=minus]").live("click", function () {
            $(this).attr("src", "images/plus.png");
            $(this).closest("tr").next().remove();
        });
    </script>
</asp:Content>
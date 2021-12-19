<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>


<script RunAt="server">

    void Application_Start(object sender, EventArgs e)
    {
        RegisterRoutes(RouteTable.Routes);
    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        Exception TheError = Server.GetLastError();
        Server.ClearError();

        Response.TrySkipIisCustomErrors = true;
        if (TheError is HttpException && ((HttpException)TheError).GetHttpCode() == 404)
        {
            Response.Redirect("/404");
        }
        else
        {
            Response.Redirect("/404");
        }
    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
    void RegisterRoutes(RouteCollection routes)
    {
        //Member Routes
        routes.MapPageRoute(
                   "HomepageRoute",
                   "",
                   "~/index.aspx");
        routes.MapPageRoute(
                   "SignInRoute",
                   "uye-ol",
                   "~/uyeol.aspx");
        routes.MapPageRoute(
                  "LogInRoute",
                  "giris-yap",
                  "~/giris.aspx");
        routes.MapPageRoute(
                  "CategoryDetailRoute",
                  "{kategoriAdi}",
                  "~/kategori-detay.aspx");
        routes.MapPageRoute(
                  "ProfileSettingsRoute",
                  "profilimi-duzenle",
                  "~/profil-duzenle.aspx");
        routes.MapPageRoute(
                  "ForgotPasswordRoute",
                  "sifremi-unuttum",
                  "~/sifremi-unuttum.aspx");

        //Guider Routes
          routes.MapPageRoute(
                  "GuiderLogInRoute",
                  "rehber/giris-yap",
                  "~/rehber/giris.aspx");
           routes.MapPageRoute(
                  "GuiderHomepageRoute",
                  "rehber/anasayfa",
                  "~/rehber/index.aspx");
          routes.MapPageRoute(
                  "GuiderGuestRoute",
                  "rehber/misafirlerim",
                  "~/rehber/misafirlerim.aspx");
          routes.MapPageRoute(
                  "GuiderShareRoute",
                  "rehber/tur-paylas",
                  "~/rehber/tur-paylas.aspx");
          routes.MapPageRoute(
                  "GuiderMyToursRoute",
                  "rehber/turlarim",
                  "~/rehber/turlarimi-goruntule.aspx");
          routes.MapPageRoute(
                  "GuiderSignUpRoute",
                  "rehber/uye-ol",
                  "~/rehber/uyeol.aspx");

        //Admin Routes
          routes.MapPageRoute(
                  "AdminHomepageRoute",
                  "admin/anasayfa",
                  "~/admin/index.aspx");
          routes.MapPageRoute(
                  "AdminLogInRoute",
                  "admin/giris",
                  "~/admin/giris.aspx");

    }
</script>

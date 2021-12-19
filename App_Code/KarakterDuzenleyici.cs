public static class KarakterDuzenleyici
{
    public static string KarakterDuzenle(string kelime)
    {
        kelime = kelime.ToLower();
        return kelime.Replace('ş', 's').
                      Replace('ç', 'c').
                      Replace('ğ', 'g').
                      Replace('ü', 'u').
                      Replace('ı', 'i').
                      Replace('ö', 'o').
                      Replace(' ', '-').
                      Replace("?", "").
                      Replace(",", "").
                      Replace(".", "").
                      Replace("\"", "").
                      Replace("#", "").
                      Replace("*", "").
                      Replace("/", "-").
                      Replace("<", "").
                      Replace(">", "").
                      Replace(";", "").
                      Replace("=", "").
                      Replace("&", "").
                      Replace("+", "").
                      Replace("$", "").
                      Replace("%", "").
                      Replace("~", "").
                      Replace("(", "").
                      Replace(")", "").
                      Replace("{", "").
                      Replace("}", "").
                      Replace("!", "").
                      Replace("|", "").
                      Replace("^", "").
                      Replace("[", "").
                      Replace("]", "").
                      Replace("@", "");
    }
}
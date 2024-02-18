module TranslationsHelper
  TRANSLATIONS = {
    email_address:  { "🇺🇸": "Your email address", "🇪🇸": "Tu correo electrónico", "🇫🇷": "Votre adresse courriel", "🇮🇳": "आपका ईमेल पता", "🇩🇪": "Ihre E-Mail-Adresse" },
    password: { "🇺🇸": "Enter your password", "🇪🇸": "Introduce tu contraseña", "🇫🇷": "Saisissez votre mot de passe", "🇮🇳": "अपना पासवर्ड दर्ज करें", "🇩🇪": "Geben Sie Ihr Passwort ein" },
    update_password: { "🇺🇸": "Change password", "🇪🇸": "Cambiar contraseña", "🇫🇷": "Changer le mot de passe", "🇮🇳": "पासवर्ड बदलें", "🇩🇪": "Passwort ändern" },
    user_name: { "🇺🇸": "Your name", "🇪🇸": "Tu nombre", "🇫🇷": "Votre nom", "🇮🇳": "आपका नाम", "🇩🇪": "Ihren Name" },
    account_name: { "🇺🇸": "Name this account", "🇪🇸": "Nombre de esta cuenta", "🇫🇷": "Nommez ce compte", "🇮🇳": "इस खाते का नाम दें", "🇩🇪": "Benennen Sie dieses Konto" },
    room_name: { "🇺🇸": "Name the room", "🇪🇸": "Nombrar la sala", "🇫🇷": "Nommez la salle", "🇮🇳": "कमरे का नाम दें", "🇩🇪": "Geben Sie dem Raum einen Namen" },
    invite_message: { "🇺🇸": "Welcome to Campfire. Don't be a stranger—say hello and introduce yourself.", "🇪🇸": "Bienvenido a Campfire. No seas un extraño: di hola y preséntate.", "🇫🇷": "Bienvenue sur Campfire. Ne soyez pas un étranger: dites bonjour et présentez-vous.", "🇮🇳": "Campfire में आपका स्वागत है। अजनबी मत बनो—हैलो कहो और अपना परिचय दो।", "🇩🇪": "Willkommen bei Campfire. Sei kein Fremder – sag Hallo und stell dich vor." },
    incompatible_browser_messsage: { "🇺🇸": "Upgrade to a supported web browser. Campfire requires a modern web browser. Please use one of the browsers listed below and make sure auto-updates are enabled.", "🇪🇸": "Actualiza a un navegador web compatible. Campfire requiere un navegador web moderno. Utiliza uno de los navegadores listados a continuación y asegúrate de que las actualizaciones automáticas estén habilitadas.", "🇫🇷": "Mettez à jour vers un navigateur web pris en charge. Campfire nécessite un navigateur web moderne. Veuillez utiliser l'un des navigateurs répertoriés ci-dessous et assurez-vous que les mises à jour automatiques sont activées.", "🇮🇳": "समर्थित वेब ब्राउज़र में अपग्रेड करें। Campfire को एक आधुनिक वेब ब्राउज़र की आवश्यकता है। कृपया नीचे सूचीबद्ध ब्राउज़रों में से कोई एक का उपयोग करें और सुनिश्चित करें कि स्वचालित अपडेट्स सक्षम हैं।", "🇩🇪": "Aktualisieren Sie auf einen unterstützten Webbrowser. Campfire erfordert einen modernen Webbrowser. Verwenden Sie bitte einen der unten aufgeführten Browser und stellen Sie sicher, dass automatische Updates aktiviert sind." },
    bio: { "🇺🇸": "A few words about yourself", "🇪🇸": "Algunas palabras sobre ti mismo", "🇫🇷": "Quelques mots sur vous-même", "🇮🇳": "अपने बारे में कुछ शब्द।", "🇩🇪": "Ein paar Worte über sich selbst" },
    webhook_url: { "🇺🇸": "Webhook URL", "🇪🇸": "URL del Webhook", "🇫🇷": "URL du webhook", "🇮🇳": "वेबहुक URL", "🇩🇪": "Webhook-URL" },
    chat_bots: { "🇺🇸": "Chat bots. With Chat bots, other sites and services can post updates directly to Campfire.", "🇪🇸": "Bots de chat. Con los bots de chat, otros sitios y servicios pueden publicar actualizaciones directamente en Campfire.", "🇫🇷": "Bots de discussion. Avec les bots de discussion, d'autres sites et services peuvent publier des mises à jour directement sur Campfire.", "🇮🇳": "चैट बॉट। चैट बॉट के साथ, अन्य साइटों और सेवाएं सीधे कैम्पफायर में अपडेट पोस्ट कर सकती हैं।", "🇩🇪": "Chat-Bots. Mit Chat-Bots können andere Websites und Dienste Updates direkt in Campfire veröffentlichen." },
    bot_name: { "🇺🇸": "Name the bot", "🇪🇸": "Nombrar al bot", "🇫🇷": "Nommer le bot", "🇮🇳": "बॉट का नाम दें", "🇩🇪": "Benenne den Bot" },
    custom_styles: { "🇺🇸": "Add custom CSS styles. Use Caution: you could break things.", "🇪🇸": "Agrega estilos CSS personalizados. Usa precaución: podrías romper cosas.", "🇫🇷": "Ajoutez des styles CSS personnalisés. Utilisez avec précaution : vous pourriez casser des choses.", "🇮🇳": "कस्टम CSS स्टाइल जोड़ें। सावधानी बरतें: आप चीज़ों को तोड़ सकते हैं।", "🇩🇪": "Fügen Sie benutzerdefinierte CSS-Stile hinzu. Vorsicht: Sie könnten Dinge kaputt machen." }
  }

  def translations_for(translation_key)
    tag.dl(class: "language-list") do
      TRANSLATIONS[translation_key].map do |language, translation|
        concat tag.dt(language)
        concat tag.dd(translation, class: "margin-none")
      end
    end
  end

  def translation_button(translation_key)
    tag.details(class: "position-relative", data: { controller: "popup", action: "keydown.esc->popup#close toggle->popup#toggle click@document->popup#closeOnClickOutside", popup_orientation_top_class: "popup-orientation-top" }) do
      tag.summary(class: "btn", tabindex: -1) do
        concat image_tag("globe.svg", size: 20, role: "presentation", class: "color-icon")
        concat tag.span("Translate", class: "for-screen-reader")
      end +
      tag.div(class: "lanuage-list-menu shadow", data: { popup_target: "menu" }) do
        translations_for(translation_key)
      end
    end
  end
end

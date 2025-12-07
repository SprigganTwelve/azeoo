
# azeoo test

##  Description

Il s'agit d'un test consistant à la réalisation d'une application **React Native** avec une intégration **Flutter**.  
L'application React Native doit être capable d'afficher deux onglets différents :
- Le premier permet à l'utilisateur de fournir une valeur `id`.
- Le second affiche une vue (réalisée en Flutter) à l'aide de cet `id`.


##  Stack Technique

###  Packages principaux (React Native)

- **@react-navigation/native**      : pour définir la navigation
- **react-native-screens**          : pour définir les écrans associié aux routes
- **@react-navigation/bottom-tabs** : permet de créer les composants dans une TabBar responsable de leur navigation

### Packages principaux (Flutter)
- **http: ^1.6.0**                  : est une solution simple et optimisé pour réaliser des appel api à l'intérieur d'un projet flutter.
- **go_router: ^17.0.0**            : établir un sytème de router propre au module
- **flutter_riverpod: ^3.0.3**      : gestion des états interne dans flutter
- **shared_preferences: ^2.5.3**    : gestion du cache flutter

```            
Nous avons décidé d'utiliser ces packages plutôt que d'autres solutions alternatives car ils sont plus simples et concis.

- flutter_riverpod : permet une gestion d’état moderne, claire et évoluée, basée sur des Providers.
                     Il facilite aussi les gestions asynchrones avec builder (error, loading, data),
                     contrairement à Bloc ou Redux qui sont plus lourds et complexes.

- shared_preferences : permet de gérer des données persistantes très simplement.
                      Alternative légère à Hive.
```
    
# Comment lancer l'application
## AVANT LANCEMENT
Assurez-vous de remplir les prérequis suivants :
- **Node.js** installé (version recommandée : 22.19.0).
- **Flutter SDK** compatible avec les modules AAR (utilisé ici : 3.10.5).
- **JVM** compatible avec React Native (idéalement JDK 17.x).
- **Android Studio** installé avec un émulateur Android (SDK 24 ou 26).
- Variable d'environnement **ANDROID_HOME** correctement configurée.


## Lancement

```
Après avoir vérifié les étapes précédentes, vous êtes prêt à lancer l'application localement
sur un émulateur Android depuis Android Studio :

- Rendez-vous dans le dossier azeoo/flutter_profile_module et exécutez :
      flutter pub get
  Cette commande installe toutes les dépendances Flutter définies dans pubspec.yaml
                                          
- Rendez-vous dans le dossier azeoo/frontend et exécutez :
      npm install
  Cette commande télécharge les packages nécessaires à l'exécution du projet React Native.
                                          
- Pour lancer l'application sur Android :
      npx react-native run-android

- Pour lancer l'application sur iOS :
      npx react-native run-ios

```

        
## APRES LANCEMENT
vous pouvez arrêter votre application en fermant simplement votre emulateur ou en  tapant Ctrl+C (sous windowns)
        


## ARCHITECTURE DE L'APPLICATION:

```
Cette application est organisée autour de deux repertoires principaux:
/frontend
    /android        → code natif Android
    /ios            → code natif iOS
    /node_modules   → packages installés
    /pages          → pages utilisées dans l'application
        /components → composants React
            /native → composants natifs embarqués
        home_screen.tsx      → écran Home (1er onglet)
        profile_screen.tsx   → écran Profil (2ème onglet)
    App.tsx → point d’entrée principal

        

(2): Le module flutter est organisé comme suit:
/flutter_profile_module
    /.android  → code natif Android du module
    /build     → module Flutter compilé en AAR
    /test      → tests unitaires
    /lib       → source Flutter principale
        main.dart → point d’entrée du module

        /core
            /errors
                api_errors.dart
                cache_errors.dart
            api_client        → client HTTP
            cache_management  → gestion minimale de cache

        /data
            /models          → modèles de données
            /repositories    → appels API + mapping des données

        /domain             → logique métier

        /presentation
            /pages           → widgets majeurs des écrans
            /state           → providers + gestion d’état (Riverpod)
            /widgets         → composants UI secondaires

                
```
                        






            
    


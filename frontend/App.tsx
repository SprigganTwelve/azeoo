

import {  StyleSheet, View } from 'react-native';

import { NavigationContainer } from '@react-navigation/native';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';

import HomeScreen from './pages/home_screen';
import ProfileScreen from './pages/profile_screen';
import AppProvider from './context/context_provider';


const Tab = createBottomTabNavigator(); // Tab navigator



function App() {

  return (
    <AppProvider>
        <NavigationContainer>
            <Tab.Navigator
              screenOptions={{
                lazy: true,
                headerShown: false,
                tabBarActiveTintColor: '#2196F3',
                tabBarInactiveTintColor: 'gray',
              }}
            >
              <Tab.Screen name="home" component={HomeScreen} options={{ title: "Input" }}/>
              <Tab.Screen name="profile" component={ProfileScreen} options={{ title: "profile" }}/>
            </Tab.Navigator>
        </NavigationContainer>
    </AppProvider>
  );
}





export default App;

import React, { useContext, useEffect } from 'react';
import { View, StyleSheet, Button } from 'react-native';
import { NativeModules } from 'react-native';
import { FlutterView } from './components/native/FlutterView';
import { useAppContext } from '../context/context_provider';
import { SafeAreaView } from 'react-native-safe-area-context';

const { FlutterBridge } = NativeModules;



const ProfileScreen = () => {
  const { userId, setUserId } = useAppContext();

  useEffect(() => {
    // update flutter when userId change
    FlutterBridge.setUserId(userId);
  }, [userId]);

  return (
    <SafeAreaView style={styles.container}>
      <FlutterView style={styles.flutterContainer} />
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1 },
  flutterContainer: { flex: 1 },
});

export default ProfileScreen;

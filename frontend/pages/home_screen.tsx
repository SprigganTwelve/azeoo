
import { View, TextInput, Text, Button, TouchableOpacity } from 'react-native';
import { StyleSheet } from "react-native";
import { useAppContext } from '../context/context_provider';
import { useState } from 'react';



const HomeScreen = ({ }) => {
    const { setUserId } = useAppContext()
    const [tempValue, setTempValue] = useState(0);

    const handleSubmit = () => {
      setUserId(tempValue);
    };

    return ( 
        <View style={styles.container}>
            <TextInput
              placeholder='Enter a user id'
              style={styles.textInput}
              onChangeText={(text)=> {
                const id = Number(text)
                if(!isNaN(id))
                  setTempValue(Number(text)) 
              }}
            />
            <TouchableOpacity style={styles.button} onPress={handleSubmit}>
              <Text style={styles.buttonText}>Find</Text>
            </TouchableOpacity>
        </View>
     );
}
 


const styles = StyleSheet.create({
  container: {
    flex: 1,
    gap: 10,
    width: "100%",
    height: "100%",
    alignItems: 'center',
    flexDirection: "row",
    justifyContent: "center",
  },
  button: {
    backgroundColor: '#2196F3',
    padding: 10,
    borderRadius: 5,
  },
  textInput:{
    width: 200,
    fontSize: 16,
    borderRadius: 25,
    paddingHorizontal: 20,
    backgroundColor: "#fff",
  },
  buttonText: {
    color: '#fff',
    fontWeight: 'bold',
  }
});

export default HomeScreen;
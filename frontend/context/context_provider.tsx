import React, { createContext, useContext, useState } from "react";



interface AppProviderProps{
    children: React.ReactNode,
}


interface AppContextValue{
    userId: number,
    setUserId: React.Dispatch<React.SetStateAction<number>>
}


export const AppContext = createContext<AppContextValue | null>(null)



const AppProvider: React.FC<AppProviderProps> = ({children}) => {
    const [userId, setUserId] = useState(1);

    return ( 
        <AppContext.Provider value={{ userId, setUserId }}>
            {children}
        </AppContext.Provider>
    );
}
 
export default AppProvider;

export function useAppContext(){
    const ctx = useContext(AppContext)
    if(ctx){
        return ctx
    }
    throw Error("Something went wrong while retreiving the app context");
}

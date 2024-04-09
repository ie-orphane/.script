import { Text, View } from "react-native";
import { useAppContext } from "../../../context";

export const HomeScreen = () => {
  const { setRoute } = useAppContext();

  return (
    <View className="h-screen items-center justify-center">
      <Text>Welcome to Home!</Text>
      <Text
        onPress={() => setRoute("Profile")}
        className="mt-32 bg-dark text-white py-3 px-6 rounded-lg font-medium"
      >
        Go to profile
      </Text>
    </View>
  );
};

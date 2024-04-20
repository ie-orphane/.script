import { Text, View } from "react-native";
import { useAppContext } from "../../../context";

export const ProfileScreen = () => {
  const { setRoute } = useAppContext();

  return (
    <View className="h-screen items-center justify-center bg-dark">
      <Text className="text-white">Welcome to Profile!</Text>
      <Text
        onPress={() => setRoute("Home")}
        className="mt-32 bg-white text-dark py-3 px-6 rounded-lg font-medium"
      >
        Back to Home
      </Text>
    </View>
  );
};

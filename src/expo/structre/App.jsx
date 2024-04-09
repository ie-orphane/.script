import ExpoStatusBar from "expo-status-bar/build/ExpoStatusBar";
import { AppProvider } from "./context";
import { AppNavigation } from "./app/navigation/appNavigation";

export default function App() {
  return (
    <AppProvider>
      <AppNavigation />
      <ExpoStatusBar style="inverted" />
    </AppProvider>
  );
}

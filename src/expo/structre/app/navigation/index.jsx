import { HomeScreen, ProfileScreen } from "../screens";
import { useAppContext } from "../../context";

export const AppNavigation = () => {
  const { Route } = useAppContext();

  const screens = {
    Home: <HomeScreen />,
    Settings: <ProfileScreen />,
  };

  return <>{screens[Route]}</>;
};

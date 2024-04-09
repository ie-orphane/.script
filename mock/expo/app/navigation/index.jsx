import { HomeScreen, ProfileScreen } from "../screens";
import { useAppContext } from "../../context";

export const AppNavigation = () => {
  const { Route } = useAppContext();

  const screens = {
    Home: <HomeScreen />,
    Profile: <ProfileScreen />,
  };

  return <>{screens[Route]}</>;
};

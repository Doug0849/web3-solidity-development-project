import { ConnectButton } from "@rainbow-me/rainbowkit";

export default function Nav({ styles }: any) {
  return (
    <div className={styles.nav}>
      <ConnectButton />
    </div>
  );
}

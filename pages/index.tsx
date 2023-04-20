import { ConnectButton } from "@rainbow-me/rainbowkit";
import type { NextPage } from "next";
import Head from "next/head";
import styles from "../styles/Home.module.css";
import Nav from "../components/Nav";

const Home: NextPage = () => {
  return (
    <>
      <Nav styles={styles} />
      <Head>
        <title>Like Social Media</title>
        <link href="/favicon.ico" rel="icon" />
      </Head>
      <main className={styles.main}>
        <h1 className={styles.title}>Welcome to Like Social Platform</h1>
      </main>

      <footer className={styles.footer}>
        <a href="https://rainbow.me" rel="noopener noreferrer" target="_blank">
          Made with ❤️ by your frens at 🌈
        </a>
      </footer>
    </>
  );
};

export default Home;

import './LoadingPage.css'

export default function LoadingPage() {
  return (
    <div class="loader-wrapper">
      <div class="loader">
        <div class="ball"></div>
        <div class="ball"></div>
        <div class="ball"></div>
        <div class="ball"></div>
      </div>
      <div class="text">LOADING...</div>
    </div>
  )
}
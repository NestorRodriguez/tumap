import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SocioeconomicoPage } from './socioeconomico.page';

describe('SocioeconomicoPage', () => {
  let component: SocioeconomicoPage;
  let fixture: ComponentFixture<SocioeconomicoPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SocioeconomicoPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SocioeconomicoPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

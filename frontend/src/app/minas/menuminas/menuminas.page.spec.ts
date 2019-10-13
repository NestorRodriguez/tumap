import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MenuminasPage } from './menuminas.page';

describe('MenuminasPage', () => {
  let component: MenuminasPage;
  let fixture: ComponentFixture<MenuminasPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MenuminasPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MenuminasPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
